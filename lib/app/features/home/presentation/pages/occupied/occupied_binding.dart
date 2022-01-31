import 'package:get/get.dart';

import 'occupied_controller.dart';

class OccupiedBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut<OccupiedController>(
        OccupiedController.new,
      );
}
