import 'package:either_dart/either.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/languages/keys_translation.dart';
import '../../domain/repositories/cache_storage_repositories.dart';

class CacheStorageRepositoryImpl implements CacheStorageRepository {
  CacheStorageRepositoryImpl({required this.localStorage});

  final GetStorage localStorage;

  @override
  bool hasData({required String key}) {
    return localStorage.hasData(key);
  }

  @override
  Future<void> remove({required String key}) async {
    await localStorage.remove(key);
  }

  @override
  Either<Failure, String> read({required String key}) {
    try {
      if (hasData(key: key)) {
        final String? result = localStorage.read<String>(key);
        return Right<Failure, String>(result!);
      }
      return const Right<Failure, String>('');
    } on Exception catch (e) {
      return Left<Failure, String>(
        CachedFailure(message: '${KeysTranslation.textErrorCache.tr}: $e'),
      );
    }
  }

  @override
  Future<Either<Failure, void>> write({
    required String key,
    required String value,
  }) async {
    try {
      if (hasData(key: key)) {
        await localStorage.write(key, value);
      } else {
        await localStorage.writeIfNull(key, value);
      }
      return const Right<Failure, void>(null);
    } on Exception catch (e) {
      return Left<Failure, void>(
        CachedFailure(message: '${KeysTranslation.textErrorCache.tr}: $e'),
      );
    }
  }

  @override
  Future<void> erase() async {
    await localStorage.erase();
  }
}
