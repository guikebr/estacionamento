import 'package:either_dart/either.dart';

import '../../../../core/errors/failure.dart';
import '../../../home/domain/repositories/cache_storage_repositories.dart';

abstract class GetHourValue {
  Either<Failure, double> call();
}

class GetHourValueImpl implements GetHourValue {
  GetHourValueImpl({required this.cacheStorage});

  final CacheStorageRepository cacheStorage;

  @override
  Either<Failure, double> call() {
    final bool check = cacheStorage.hasData(key: 'hour_value');
    if (check) {
      final Either<Failure, String> theme = cacheStorage.read(
        key: 'hour_value',
      );
      if (theme.isRight) {
        return Right<Failure, double>(double.tryParse(theme.right) ?? 0);
      }
    }
    return const Right<Failure, double>(0);
  }
}
