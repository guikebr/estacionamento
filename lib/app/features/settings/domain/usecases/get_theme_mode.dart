import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';

import '../../../../core/errors/failure.dart';
import '../../../home/domain/repositories/cache_storage_repositories.dart';

abstract class GetThemeMode {
  Either<Failure, int> call();
}

class GetThemeModeImpl implements GetThemeMode {
  GetThemeModeImpl({required this.cacheStorage});

  final CacheStorageRepository cacheStorage;

  @override
  Either<Failure, int> call() {
    final bool check = cacheStorage.hasData(key: 'theme_mode');
    if (check) {
      final Either<Failure, String> theme = cacheStorage.read(
        key: 'theme_mode',
      );
      if (theme.isRight) {
        return Right<Failure, int>(int.parse(theme.right));
      }
    }
    return Right<Failure, int>(ThemeMode.system.index);
  }
}
