part of 'injection_container.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await onboardingInit();
  await _authInit();
}

Future<void> _authInit() async {
  sl
    ..registerFactory(
      () => AuthBloc(
        signIn: sl(),
        signUp: sl(),
        forgotPassword: sl(),
        updateUser: sl(),
      ),
    )
    ..registerLazySingleton(() => SignIn(sl()))
    ..registerLazySingleton(() => SignUp(sl()))
    ..registerLazySingleton(() => ForgotPassword(sl()))
    ..registerLazySingleton(() => UpdateUser(sl()))
    ..registerLazySingleton<AuthRepo>(() => AuthRepoImpl(sl()))
    ..registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(
        authClient: sl(),
        cloudStoreClient: sl(),
        dbClient: sl(),
      ),
    )
    ..registerLazySingleton(() => FirebaseAuth.instance)
    ..registerLazySingleton(() => FirebaseStorage.instance)
    ..registerLazySingleton(() => FirebaseFirestore.instance);
}

Future<void> onboardingInit() async {
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
