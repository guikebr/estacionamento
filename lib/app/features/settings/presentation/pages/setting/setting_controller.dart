import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:get/get.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/spacing/shape.dart';
import '../../../../../core/spacing/spacing.dart';
import '../../../../../core/typography/typography.dart' as typo;
import '../../../domain/usecases/get_theme_mode.dart';
import '../../../domain/usecases/get_value_hour.dart';
import '../../../domain/usecases/save_cache_storage.dart';

class SettingController extends GetxController {
  SettingController({
    required this.getHourValue,
    required this.getCacheStorage,
    required this.cacheStorage,
  });

  final GetHourValue getHourValue;
  final GetThemeMode getCacheStorage;
  final SaveCacheLogged cacheStorage;

  late MoneyMaskedTextController valueController;

  Spacing get spacing => const Spacing();

  Shape get shape => const Shape();

  typo.Typography get typography => const typo.Typography();

  int get currentTheme => getCacheStorage().fold(
        (Failure left) => 0,
        (int right) => right,
      );

  double get currentHourValue => getHourValue().fold(
        (Failure left) => 10,
        (double right) => right > 0 ? right : 10,
      );

  List<ThemeMode> get themes => ThemeMode.values;

  @override
  void onInit() {
    super.onInit();
    valueController = MoneyMaskedTextController(initialValue: currentHourValue);
  }

  void changeValueHour(String value) {
    final double? newValue = double.tryParse(value.replaceAll(',', '.'));
    if (value.isNotEmpty && newValue != null) {
      cacheStorage(
        params: SaveStorageParams(
          key: 'hour_value',
          value: newValue.toString(),
        ),
      );
      update();
    }
  }

  void changeTheme(int? theme) {
    if (theme != null) {
      cacheStorage(
        params: SaveStorageParams(key: 'theme_mode', value: theme.toString()),
      );
      Get.changeThemeMode(ThemeMode.values[theme]);
      update();
    }
  }
}
