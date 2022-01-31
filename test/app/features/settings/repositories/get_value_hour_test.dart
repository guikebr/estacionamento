import 'package:either_dart/either.dart';
import 'package:estacionamento/app/core/errors/failure.dart';
import 'package:estacionamento/app/features/home/domain/repositories/cache_storage_repositories.dart';
import 'package:estacionamento/app/features/settings/domain/usecases/get_value_hour.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockSCacheStorageRepository extends Mock
    implements CacheStorageRepository {}

void main() {
  late MockSCacheStorageRepository _mockRepository;
  late GetHourValue useCase;
  const String key = 'hour_value';
  const String date = '1';

  setUp(() async {
    _mockRepository = MockSCacheStorageRepository();
    useCase = GetHourValueImpl(cacheStorage: _mockRepository);
  });

  group('Read', () {
    setUp(() async {
      when(_mockRepository.write(key: key, value: date)).thenAnswer(
        (_) async => const Right<Failure, void>(null),
      );
    });

    test('should return is right', () async {
      final Either<Failure, double> actual = useCase();
      expect(actual.isRight, true);
      verify(() => _mockRepository.read(key: key));
      verifyNoMoreInteractions(_mockRepository);
    });
  });
}
