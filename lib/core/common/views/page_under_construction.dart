import 'package:flutter/material.dart';
import 'package:flutter_bloc_tdd/core/res/media_res.dart';
import 'package:lottie/lottie.dart';

class PageUnderConstruction extends StatelessWidget {
  const PageUnderConstruction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              MediaRes.onBoardingBackground,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Lottie.asset(
            MediaRes.pageUnderConstruction,
          ),
        ),
      ),
    );
  }
}
