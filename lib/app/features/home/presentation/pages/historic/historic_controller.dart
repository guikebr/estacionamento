import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../core/languages/keys_translation.dart';
import '../../../../../core/spacing/spacing.dart';
import '../../../../../core/typography/typography.dart';
import '../../../domain/entities/garage_info.dart';
import '../home/home_controller.dart';

class HistoricController extends GetxController {
  Typography get typography => const Typography();

  Spacing get spacing => const Spacing();

  HomeController get homeController => Get.find<HomeController>();

  List<GarageInfo> get historic => homeController.historic;

  bool get isEmptyList => historic.isEmpty;

  String get totalReceived {
    double total = 0;

    final List<double> values =
        historic.map((GarageInfo e) => e.total ?? 0).toList();

    for (final double value in values) {
      total += value;
    }

    return 'R\$${total.toStringAsFixed(2).replaceAll('.', ',')}';
  }

  final DateFormat _day = DateFormat('dd-MM-yyyy');
  final DateFormat _hours = DateFormat('HH:mm a');

  String receiveToValue(GarageInfo garage) =>
      '\nRecibo: R\$${garage.total!.toStringAsFixed(2).replaceAll('.', ',')}';

  String day(GarageInfo garage) => '${KeysTranslation.textEntrance.tr}: '
      '${_day.format(garage.entrance!)} - ${_hours.format(garage.entrance!)}';

  String hours(GarageInfo garage) => '\n${KeysTranslation.textExit.tr}: '
      '${_day.format(garage.exit!)} - ${_hours.format(garage.exit!)}';
}
