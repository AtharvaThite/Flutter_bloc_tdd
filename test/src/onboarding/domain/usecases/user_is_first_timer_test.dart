import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_tdd/src/onboarding/domain/repos/onboarding_repo.dart';
import 'package:flutter_bloc_tdd/src/onboarding/domain/usecases/user_is_first_timer.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'onboarding_repo.mock.dart';

void main() {
  late OnboardingRepo repo;
  late CheckIfUserIsFirstTimer usecase;

  setUp(() {
    repo = MockOnboardingRepo();
    usecase = CheckIfUserIsFirstTimer(repo);
  });

  test(
      'Should call the [OnboardingRepo.userIsFirstTimer] '
      'and return the proper data', () async {
    //arrange
    when(() => repo.checkIfUserIsFirstTimer()).thenAnswer(
      (_) async => const Right(true),
    );

    //act
    final result = await usecase();

    //assert
    expect(
      result,
      equals(
        const Right<dynamic, bool>(true),
      ),
    );
    verify(() => repo.checkIfUserIsFirstTimer()).called(1);
    verifyNoMoreInteractions(repo);
  });
}
