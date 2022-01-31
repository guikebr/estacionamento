import 'package:get/get.dart';

import '../../../../../core/routes/app_pages.dart';
import '../../../../../core/spacing/spacing.dart';
import '../../../../../core/typography/typography.dart';
import '../../../domain/entities/garage_info.dart';
import '../home/home_controller.dart';

class OccupiedController extends GetxController {
  Typography get typography => const Typography();

  Spacing get spacing => const Spacing();

  HomeController get homeController => Get.find<HomeController>();

  List<GarageInfo> get garages => homeController.parking.garages
      .where((GarageInfo e) => e.entrance != null)
      .toList();

  bool get isEmpty => garages.isEmpty;

  Future<void> navigate(GarageInfo garage) async {
    await Get.toNamed<dynamic>(Routes.finalizePage, arguments: garage);
    update();
  }
}
