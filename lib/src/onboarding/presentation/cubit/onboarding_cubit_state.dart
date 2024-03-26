part of 'onboarding_cubit_cubit.dart';

sealed class OnboardingCubitState extends Equatable {
  const OnboardingCubitState();

  @override
  List<Object> get props => [];
}

final class OnboardingCubitInitial extends OnboardingCubitState {
  const OnboardingCubitInitial();
}

final class CachingFirstTimer extends OnboardingCubitState {
  const CachingFirstTimer();
}

final class CheckingIfUserIsFirstTimer extends OnboardingCubitState {
  const CheckingIfUserIsFirstTimer();
}

final class UserCached extends OnboardingCubitState {
  const UserCached();
}

final class OnboardingStatus extends OnboardingCubitState {
  const OnboardingStatus({required this.isFirstTimer});
  final bool isFirstTimer;
  @override
  List<bool> get props => [isFirstTimer];
}

final class OnboardingError extends OnboardingCubitState {
  const OnboardingError(this.message);
  final String message;
  @override
  List<String> get props => [message];
}
