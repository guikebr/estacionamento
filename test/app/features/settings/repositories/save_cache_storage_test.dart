import 'package:either_dart/either.dart';
import 'package:estacionamento/app/core/errors/failure.dart';
import 'package:estacionamento/app/features/home/domain/repositories/cache_storage_repositories.dart';
import 'package:estacionamento/app/features/settings/domain/usecases/save_cache_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockSCacheStorageRepository extends Mock
    implements CacheStorageRepository {}

void main() {
  late MockSCacheStorageRepository _mockRepository;
  late SaveCacheLogged useCase;
  const String key = 'key';
  const String date = '1';

  setUpAll(() async {
    _mockRepository = MockSCacheStorageRepository();
    useCase = SaveCacheLogged(cacheStorage: _mockRepository);
  });

  const SaveStorageParams params = SaveStorageParams(value: date, key: key);

  group('Save', () {
    setUp(() async {
      when(await _mockRepository.write(key: key, value: date)).thenAnswer(
        (_) => const Right<Failure, void>(null),
      );
    });

    test('should return is right', () async {
      final Either<Failure, void> actual = await useCase(params: params);
      expect(actual.isRight, true);
      verify(() => _mockRepository.write(key: params.key, value: params.value));
      verifyNoMoreInteractions(_mockRepository);
    });
  });
}
