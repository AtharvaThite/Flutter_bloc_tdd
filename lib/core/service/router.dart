import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc_tdd/core/common/views/page_under_construction.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    // case OnboardingScreen.routeName:
    //   return _pageBuilder(
    //     (_) => const OnboardingScreen(),
    //     settings: settings,
    //   );

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
