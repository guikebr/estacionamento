import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../home/infra/repositories/cache_storage_repository_impl.dart';
import '../../../domain/usecases/get_theme_mode.dart';
import '../../../domain/usecases/get_value_hour.dart';
import '../../../domain/usecases/save_cache_storage.dart';
import 'setting_controller.dart';

class SettingBinding extends Bindings {
  @override
  void dependencies() {
    final CacheStorageRepositoryImpl cacheRepository =
        CacheStorageRepositoryImpl(
      localStorage: GetStorage(),
    );
    Get.lazyPut<SettingController>(
      () => SettingController(
        getCacheStorage: GetThemeModeImpl(cacheStorage: cacheRepository),
        cacheStorage: SaveCacheLogged(cacheStorage: cacheRepository),
        getHourValue: GetHourValueImpl(cacheStorage: cacheRepository),
      ),
    );
  }
}
