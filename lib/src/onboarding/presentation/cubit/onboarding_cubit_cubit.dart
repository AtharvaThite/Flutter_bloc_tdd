import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_tdd/src/onboarding/domain/usecases/cache_first_timer.dart';
import 'package:flutter_bloc_tdd/src/onboarding/domain/usecases/user_is_first_timer.dart';

part 'onboarding_cubit_state.dart';

class OnboardingCubitCubit extends Cubit<OnboardingCubitState> {
  OnboardingCubitCubit({
    required CacheFirstTimer cacheFirstTimer,
    required CheckIfUserIsFirstTimer checkIfUserIsFirstTimer,
  })  : _cacheFirstTimer = cacheFirstTimer,
        _checkIfUserIsFirstTimer = checkIfUserIsFirstTimer,
        super(const OnboardingCubitInitial());

  final CacheFirstTimer _cacheFirstTimer;
  final CheckIfUserIsFirstTimer _checkIfUserIsFirstTimer;

  Future<void> cacheFirstTimer() async {
    final result = await _cacheFirstTimer();
    result.fold(
      (failure) => emit(OnboardingError(failure.errorMessage)),
      (_) => emit(const UserCached()),
    );
  }

  Future<void> checkIfUserIsFirstTimer() async {
    final result = await _checkIfUserIsFirstTimer();
    result.fold(
      (failure) => emit(const OnboardingStatus(isFirstTimer: true)),
      (status) => emit(
        OnboardingStatus(isFirstTimer: status),
      ),
    );
  }
}
