import 'package:flutter_bloc_tdd/src/onboarding/data/data_sources/onboarding_local_data_source.dart';
import 'package:flutter_bloc_tdd/src/onboarding/data/repos/onboarding_repo_impl.dart';
import 'package:flutter_bloc_tdd/src/onboarding/domain/repos/onboarding_repo.dart';
import 'package:flutter_bloc_tdd/src/onboarding/domain/usecases/cache_first_timer.dart';
import 'package:flutter_bloc_tdd/src/onboarding/domain/usecases/user_is_first_timer.dart';
import 'package:flutter_bloc_tdd/src/onboarding/presentation/cubit/onboarding_cubit_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final prefs = await SharedPreferences.getInstance();
  // Feature --> Onboarding
  // Business Logic
  sl
    ..registerFactory(
      () => OnboardingCubitCubit(
        cacheFirstTimer: sl(),
        checkIfUserIsFirstTimer: sl(),
      ),
    )
    ..registerLazySingleton(
      () => CacheFirstTimer(sl()),
    )
    ..registerLazySingleton(
      () => CheckIfUserIsFirstTimer(sl()),
    )
    ..registerLazySingleton<OnboardingRepo>(
      () => OnboardingRepoImple(sl()),
    )
    ..registerLazySingleton<OnboardingLocalDataSource>(
      () => OnboardingLocalDataSrcImpl(sl()),
    )
    ..registerLazySingleton(() => prefs);
}
