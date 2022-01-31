import 'package:flutter/cupertino.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../core/spacing/spacing.dart';
import '../../../../../core/typography/typography.dart';
import '../../../../home/domain/entities/car_info.dart';
import '../../../../home/infra/models/car_model.dart';
import '../../../../home/infra/models/garage_model.dart';
import '../../../../home/presentation/pages/available/available_controller.dart';

class StartController extends GetxController {
  AvailableController get availableController =>
      Get.find<AvailableController>();

  Typography get typography => const Typography();

  Spacing get spacing => const Spacing();

  DateTime get now => DateTime.now();

  final DateFormat day = DateFormat('dd-MM-yyyy');
  final DateFormat hours = DateFormat('HH:mm a');

  String get timestampDay => day.format(now);

  String get timestampHours => hours.format(now);

  late GarageModel garage;

  bool get enableStart =>
      car.name.isNotEmpty && car.contact.isNotEmpty && car.plate.isNotEmpty;

  CarInfo get car => CarModel(
        id: garage.id,
        plate: maskPlate.text,
        name: name.text,
        contact: maskContact.text,
      );

  @override
  void onInit() {
    super.onInit();
    getArg();
    addListeners();
  }

  void getArg() {
    final dynamic arg = Get.arguments;
    if (arg != null && arg is GarageModel) {
      garage = arg;
    }
  }

  void addListeners() {
    maskPlate.addListener(update);
    maskContact.addListener(update);
    name.addListener(update);
  }

  @override
  void dispose() {
    super.dispose();
    name.dispose();
    maskPlate.dispose();
    maskContact.dispose();
  }

  final MaskedTextController maskPlate = MaskedTextController(
    mask: 'AAA-0@00',
  );

  final MaskedTextController maskContact = MaskedTextController(
    mask: '(00) 00000-0000',
  );

  final TextEditingController name = TextEditingController();

  void start() {
    int index = garage.id;
    garage = GarageModel(id: index, car: car, entrance: now, total: 0);

    availableController
      ..homeController.historic.add(garage)
      ..homeController.parking.garages[--index] = garage;

    Get.back<void>();
  }
}
