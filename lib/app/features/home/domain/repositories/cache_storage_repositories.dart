import 'package:either_dart/either.dart';

import '../../../../core/errors/failure.dart';

abstract class CacheStorageRepository {
  Either<Failure, String> read({required String key});

  Future<void> erase();

  bool hasData({required String key});

  Future<void> remove({required String key});

  Future<Either<Failure, void>> write({
    required String key,
    required String value,
  });
}
