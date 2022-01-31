import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/languages/keys_translation.dart';
import '../../../../../core/spacing/spacing.dart';
import '../../../../../core/typography/typography.dart';
import '../../../../home/domain/entities/car_info.dart';
import '../../../../home/domain/entities/garage_info.dart';
import '../../../../home/infra/models/car_model.dart';
import '../../../../home/infra/models/garage_model.dart';
import '../../../../home/presentation/pages/occupied/occupied_controller.dart';
import '../../../../settings/domain/usecases/get_value_hour.dart';

class FinalizeController extends GetxController {
  FinalizeController({required this.getHourValue});

  OccupiedController get occupiedController => Get.find<OccupiedController>();

  Typography get typography => const Typography();

  Spacing get spacing => const Spacing();

  late GarageModel garage;

  final GetHourValue getHourValue;

  double get currentHourValue => getHourValue().fold(
        (Failure left) => 10,
        (double right) => right > 0 ? right : 10,
      );

  bool get enableStart =>
      car.name.isNotEmpty && car.contact.isNotEmpty && car.plate.isNotEmpty;

  CarInfo get car => CarModel(
        id: garage.id,
        plate: garage.car?.plate ?? '',
        name: garage.car?.name ?? '',
        contact: garage.car?.contact ?? '',
      );

  String get totalToPay =>
      'R\$${total.toStringAsFixed(2).replaceAll('.', ',')}';

  double get total => (currentHourValue / 60) * daysInMinutes;

  DateTime get entrance => garage.entrance ?? now;

  DateTime get now => DateTime.now();

  final DateFormat _day = DateFormat('dd-MM-yyyy');
  final DateFormat _hours = DateFormat('HH:mm a');

  String get day => '$dayEntrance'
      '\n${KeysTranslation.textExit.tr}: '
      '${_day.format(now)}';

  String get hours => '$hoursEntrance'
      '\n${KeysTranslation.textExit.tr}: '
      '${_hours.format(now)}';

  String get dayEntrance => '${KeysTranslation.textEntrance.tr}: '
      '${_day.format(entrance)}';

  String get hoursEntrance => '${KeysTranslation.textEntrance.tr}: '
      '${_hours.format(entrance)}';

  @override
  void onInit() {
    super.onInit();
    getArg();
  }

  String get hoursToPay => '${daysInMinutes}m';

  int get daysInMinutes => now.difference(entrance).inMinutes;

  bool get enableFinalize => daysInMinutes > 0;

  void getArg() {
    final dynamic arg = Get.arguments;
    if (arg != null && arg is GarageModel) {
      garage = arg;
    }
  }

  void addToHistoric() {
    garage = GarageModel(
      id: garage.id,
      car: car,
      entrance: garage.entrance,
      exit: now,
      total: total,
    );

    final List<GarageInfo> updateList =
        occupiedController.homeController.historic.map(
      (GarageInfo item) {
        if (item.id == garage.id && item.entrance == garage.entrance) {
          item = garage;
        }
        return item;
      },
    ).toList();
    occupiedController.homeController.historic = updateList;

    for (GarageInfo item in occupiedController.homeController.historic) {
      if (item.id == garage.id && item.entrance == garage.entrance) {
        item = garage;
      }
    }
  }

  void finalize() {
    addToHistoric();
    int index = garage.id;
    garage = GarageModel(id: garage.id);

    occupiedController
      ..homeController.parking.garages[--index] = garage
      ..homeController.update()
      ..update();

    Get.back<void>();
  }
}
