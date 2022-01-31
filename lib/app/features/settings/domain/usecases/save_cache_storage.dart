import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/languages/keys_translation.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../home/domain/repositories/cache_storage_repositories.dart';

class SaveCacheLogged implements UseCase<void, SaveStorageParams> {
  SaveCacheLogged({required this.cacheStorage});

  final CacheStorageRepository cacheStorage;

  @override
  Future<Either<Failure, void>> call({
    required SaveStorageParams params,
  }) async {
    try {
      await cacheStorage.write(key: params.key, value: params.value);
      return const Right<Failure, void>(null);
    } on Exception catch (e) {
      return Left<Failure, void>(
        InternalError(message: '${KeysTranslation.textErrorCache.tr}: $e'),
      );
    }
  }
}

class SaveStorageParams extends Equatable {
  const SaveStorageParams({required this.key, required this.value});

  final String key;
  final String value;

  @override
  List<Object?> get props => <Object>[key, value];
}
