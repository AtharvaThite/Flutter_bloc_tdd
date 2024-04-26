part of 'router.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    // Route to Onboarding Screen
    case OnboardingScreen.routeName:
      final prefs = sl<SharedPreferences>();
      return _pageBuilder(
        (context) {
          if (prefs.getBool(kFirstTimerKey) ?? true) {
            return BlocProvider(
              create: (context) => sl<OnboardingCubitCubit>(),
              child: const OnboardingScreen(),
            );
          } else if (sl<fa.FirebaseAuth>().currentUser != null) {
            final user = sl<fa.FirebaseAuth>().currentUser!;
            final localUser = LocalUserModel(
              uid: user.uid,
              email: user.email ?? '',
              fullName: user.displayName ?? '',
              points: 0,
            );
            context.userProvider.initUser(localUser);
            return const Dashboard();
          }
          return BlocProvider(
            create: (_) => sl<AuthBloc>(),
            child: const SignInScreen(),
          );
        },
        settings: settings,
      );

    // Route to SignIn Screen
    case SignInScreen.routeName:
      return _pageBuilder(
        (context) => BlocProvider(
          create: (_) => sl<AuthBloc>(),
          child: const SignInScreen(),
        ),
        settings: settings,
      );

    //Route to SignUp Screen
    case SignUpScreen.routeName:
      return _pageBuilder(
        (context) => BlocProvider(
          create: (_) => sl<AuthBloc>(),
          child: const SignUpScreen(),
        ),
        settings: settings,
      );

    //Route to Dashboard
    case Dashboard.routeName:
      return _pageBuilder(
        (context) => BlocProvider(
          create: (_) => sl<AuthBloc>(),
          child: const Dashboard(),
        ),
        settings: settings,
      );

    //route to forgot password screen
    case ForgotPasswordScreen.routeName:
      return _pageBuilder(
        (context) => const ForgotPasswordScreen(),
        settings: settings,
      );

    //Default Route
    default:
      return _pageBuilder(
        (_) => const PageUnderConstruction(),
        settings: settings,
      );
  }
}

PageRouteBuilder<dynamic> _pageBuilder(
  Widget Function(BuildContext context) page, {
  required RouteSettings settings,
}) {
  return PageRouteBuilder(
    settings: settings,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(
      opacity: animation,
      child: child,
    ),
    pageBuilder: (context, _, __) => page(context),
  );
}
