import 'package:get/get.dart';

import 'available_controller.dart';

class AvailableBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut<AvailableController>(
        AvailableController.new,
      );
}
