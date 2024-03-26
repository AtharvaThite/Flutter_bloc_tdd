import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_tdd/core/errors/exceptions.dart';
import 'package:flutter_bloc_tdd/core/errors/failure.dart';
import 'package:flutter_bloc_tdd/src/onboarding/data/data_sources/onboarding_local_data_source.dart';
import 'package:flutter_bloc_tdd/src/onboarding/data/repos/onboarding_repo_impl.dart';
import 'package:flutter_bloc_tdd/src/onboarding/domain/repos/onboarding_repo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// ignore: lines_longer_than_80_chars
class MockOnboardingLocalDataSrc extends Mock
    implements OnboardingLocalDataSource {}

void main() {
  late OnboardingLocalDataSource localDataSource;
  late OnboardingRepoImple repoImpl;

  setUp(() {
    localDataSource = MockOnboardingLocalDataSrc();
    repoImpl = OnboardingRepoImple(localDataSource);
  });

  test('Should be a subclass of [OnboardingRepo]', () {
    expect(repoImpl, isA<OnboardingRepo>());
  });

  group('cacheFirstTimer', () {
    test('cacheFirstTimer Success Test', () async {
      when(() => localDataSource.cacheFirstTimer()).thenAnswer(
        (_) => Future.value(),
      );

      final result = await repoImpl.cacheFirstTimer();

      expect(
        result,
        equals(
          const Right<dynamic, void>(null),
        ),
      );

      verify(
        () => localDataSource.cacheFirstTimer(),
      );
      verifyNoMoreInteractions(localDataSource);
    });

    test('cacheFirstTimer Failure Test', () async {
      when(() => localDataSource.cacheFirstTimer()).thenThrow(
        const CacheException(
          message: 'Insufficient Storage',
        ),
      );
      final result = await repoImpl.cacheFirstTimer();
      expect(
        result,
        equals(
          Left<CacheFailure, dynamic>(
            CacheFailure(
              message: 'Insufficient Storage',
              statusCode: 500,
            ),
          ),
        ),
      );
      verify(
        () => localDataSource.cacheFirstTimer(),
      );

      verifyNoMoreInteractions(localDataSource);
    });
  });
}
