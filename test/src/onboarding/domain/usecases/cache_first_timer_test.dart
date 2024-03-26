import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_tdd/core/errors/failure.dart';
import 'package:flutter_bloc_tdd/src/onboarding/domain/repos/onboarding_repo.dart';
import 'package:flutter_bloc_tdd/src/onboarding/domain/usecases/cache_first_timer.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'onboarding_repo.mock.dart';

void main() {
  late OnboardingRepo repo;
  late CacheFirstTimer usecase;

  setUp(() {
    repo = MockOnboardingRepo();
    usecase = CacheFirstTimer(repo);
  });

  test(
    'Should call the [OnboardingRepo.cacheFirstTimer] '
    'and return the right data',
    () async {
      when(() => repo.cacheFirstTimer()).thenAnswer(
        (_) async => Left(
          ServerFailure(
            message: 'Server Failure',
            statusCode: 500,
          ),
        ),
      );
      final result = await usecase();

      expect(
        result,
        equals(
          Left<Failure, dynamic>(
            ServerFailure(
              message: 'Server Failure',
              statusCode: 500,
            ),
          ),
        ),
      );

      verify(() => repo.cacheFirstTimer()).called(1);

      verifyNoMoreInteractions(repo);
    },
  );
}
