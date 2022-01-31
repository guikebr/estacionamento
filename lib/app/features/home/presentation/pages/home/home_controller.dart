import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/languages/keys_translation.dart';
import '../../../../../core/routes/app_pages.dart';
import '../../../../../core/spacing/spacing.dart';
import '../../../../../core/typography/typography.dart' as typo;
import '../../../domain/entities/garage_info.dart';
import '../../../domain/entities/parking_info.dart';
import '../../../infra/models/garage_model.dart';
import '../../../infra/models/parking_model.dart';
import '../available/available_controller.dart';
import '../available/available_page.dart';
import '../historic/historic_controller.dart';
import '../historic/historic_page.dart';
import '../occupied/occupied_controller.dart';
import '../occupied/occupied_page.dart';

class HomeController extends GetxController {
  late PageController pageController;

  late ParkingInfo parking;

  List<GarageInfo> historic = <GarageInfo>[];

  int? _currentPage;

  int get _countAvailable => 10;

  int get currentPage => _currentPage ?? 0;

  Spacing get spacing => const Spacing();

  typo.Typography get typography => const typo.Typography();

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: currentPage);
    parking = ParkingModel(_countAvailable, _initGaragesAvailable);
  }

  List<GarageInfo> get _initGaragesAvailable => List<GarageInfo>.generate(
        _countAvailable,
        (int index) => GarageModel(id: ++index),
      );

  Color getBackgroundColor() {
    if (currentPage == 0) {
      return Theme.of(Get.context!).colorScheme.primaryVariant;
    } else if (currentPage == 1) {
      return Theme.of(Get.context!).colorScheme.error;
    } else {
      return Theme.of(Get.context!).colorScheme.secondaryVariant;
    }
  }

  Map<int, Widget> get menu => <Widget>[
        Text(
          KeysTranslation.buttonAvailable.tr,
          style: typography.button.copyWith(color: getTextColor(0)),
        ),
        Text(
          KeysTranslation.buttonOccupied.tr,
          style: typography.button.copyWith(color: getTextColor(1)),
        ),
        Text(KeysTranslation.buttonStory.tr, style: typography.button),
      ]
          .map(
            (Widget e) => SizedBox(
              height: spacing.xlarge,
              child: Center(child: e),
            ),
          )
          .toList()
          .asMap();

  List<Widget> get getPages => const <Widget>[
        AvailablePage(),
        OccupiedPage(),
        HistoricPage(),
      ];

  Color getTextColor(int page) {
    if (currentPage == page) {
      return Theme.of(Get.context!).backgroundColor;
    } else {
      return Theme.of(Get.context!).colorScheme.onBackground;
    }
  }

  Future<void> previousPage() async {
    await pageController.previousPage(
      duration: const Duration(milliseconds: 150),
      curve: Curves.easeIn,
    );
    updatePages();
  }

  Future<void> nextPage() async {
    await pageController.nextPage(
      duration: const Duration(milliseconds: 150),
      curve: Curves.easeIn,
    );
    updatePages();
  }

  void updatePages() {
    if (currentPage == 0) {
      Get.find<AvailableController>().update();
    } else if (currentPage == 1) {
      Get.find<OccupiedController>().update();
    } else {
      Get.find<HistoricController>().update();
    }
    update();
  }

  void getChangedPage(int? page) {
    if (page != _currentPage) {
      _currentPage = page;
      pageController.jumpToPage(currentPage);
      updatePages();
    }
  }

  Future<void> navigateToSettings() async {
    await Get.toNamed<dynamic>(Routes.settingsPage);
    update();
  }
}
