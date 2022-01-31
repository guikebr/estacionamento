import 'package:get/get.dart';

import 'historic_controller.dart';

class HistoricBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut<HistoricController>(
        HistoricController.new,
      );
}
