import 'package:either_dart/either.dart';
import 'package:estacionamento/app/core/errors/failure.dart';
import 'package:estacionamento/app/features/home/domain/repositories/cache_storage_repositories.dart';
import 'package:estacionamento/app/features/settings/domain/usecases/get_theme_mode.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockSCacheStorageRepository extends Mock
    implements CacheStorageRepository {}

void main() {
  late MockSCacheStorageRepository _mockRepository;
  late GetThemeMode useCase;
  const String key = 'theme_mode';
  const String date = '1';

  setUp(() async {
    _mockRepository = MockSCacheStorageRepository();
    useCase = GetThemeModeImpl(cacheStorage: _mockRepository);
  });

  group('Read', () {
    setUp(() async {
      when(_mockRepository.read(key: key)).thenAnswer(
        (_) => const Right<Failure, String>(date),
      );
    });

    test('should return is right', () async {
      final Either<Failure, int> actual = useCase();
      expect(actual.isRight, true);
      verify(() => _mockRepository.read(key: key));
      verifyNoMoreInteractions(_mockRepository);
    });
  });
}
