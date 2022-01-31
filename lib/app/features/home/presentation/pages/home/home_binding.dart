import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    initializeDateFormatting('pt_BR');
    Get.lazyPut<HomeController>(HomeController.new);
  }
}
