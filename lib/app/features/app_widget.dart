import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../core/errors/failure.dart';
import '../core/languages/languages.dart';
import '../core/routes/app_pages.dart';
import '../core/theme/theme.dart';
import '../core/utils/logger.dart';
import 'home/infra/repositories/cache_storage_repository_impl.dart';
import 'home/presentation/pages/home/home_binding.dart';
import 'settings/domain/usecases/get_theme_mode.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  GetThemeMode get getThemeMode => GetThemeModeImpl(
        cacheStorage: CacheStorageRepositoryImpl(localStorage: GetStorage()),
      );

  ThemeMode get themeMode => getThemeMode().fold(
        (Failure left) => ThemeMode.system,
        (int right) => ThemeMode.values[right],
      );

  @override
  Widget build(BuildContext context) => GetMaterialApp(
        theme: themeLight,
        darkTheme: themeDark,
        themeMode: themeMode,
        navigatorKey: Get.key,
        getPages: AppPages.routes,
        initialBinding: HomeBinding(),
        initialRoute: AppPages.initial,
        logWriterCallback: Logger.write,
        popGesture: Get.isPopGestureEnable,
        locale: TranslationController.locale,
        opaqueRoute: Get.isOpaqueRouteDefault,
        translations: TranslationController(),
        defaultTransition: Transition.cupertino,
        transitionDuration: Get.defaultTransitionDuration,
        fallbackLocale: TranslationController.fallbackLocale,
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(EnumProperty<ThemeMode>('themeMode', themeMode))
      ..add(DiagnosticsProperty<GetThemeMode>('getThemeMode', getThemeMode));
  }
}
