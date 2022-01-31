import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../home/infra/repositories/cache_storage_repository_impl.dart';
import '../../../../settings/domain/usecases/get_value_hour.dart';
import 'finalize_controller.dart';

class FinalizeBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut<FinalizeController>(
        () => FinalizeController(
          getHourValue: GetHourValueImpl(
            cacheStorage: CacheStorageRepositoryImpl(
              localStorage: GetStorage(),
            ),
          ),
        ),
      );
}
