import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tdd/core/common/views/loading_view.dart';
import 'package:flutter_bloc_tdd/core/common/widgets/gradient_background.dart';
import 'package:flutter_bloc_tdd/core/res/colours.dart';
import 'package:flutter_bloc_tdd/core/res/media_res.dart';
import 'package:flutter_bloc_tdd/src/onboarding/domain/entities/page_content.dart';
import 'package:flutter_bloc_tdd/src/onboarding/presentation/cubit/onboarding_cubit_cubit.dart';
import 'package:flutter_bloc_tdd/src/onboarding/presentation/widgets/onboarding_body.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  static const routeName = '/';

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final pageController = PageController();
  int currentPageIndex = 0; // Track the current page index

  @override
  void initState() {
    super.initState();
    context.read<OnboardingCubitCubit>().checkIfUserIsFirstTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GradientBackground(
        image: MediaRes.onBoardingBackground,
        child: BlocConsumer<OnboardingCubitCubit, OnboardingCubitState>(
          listener: (context, state) {
            if (state is OnboardingStatus && !state.isFirstTimer) {
              Navigator.pushReplacementNamed(context, '/home');
            } else if (state is UserCached) {
              Navigator.pushReplacementNamed(context, '/');
            }
          },
          builder: (context, state) {
            if (state is CheckingIfUserIsFirstTimer ||
                state is CachingFirstTimer) {
              return const LoadingView();
            }
            return Stack(
              children: [
                PageView(
                  controller: pageController,
                  children: const [
                    OnboardingBody(pageContent: PageContent.first()),
                    OnboardingBody(pageContent: PageContent.second()),
                    OnboardingBody(pageContent: PageContent.third()),
                  ],
                ),
                Align(
                  alignment: const Alignment(0, .1),
                  child: SmoothPageIndicator(
                    controller: pageController,
                    count: 3,
                    onDotClicked: (index) {
                      pageController.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                    effect: const WormEffect(
                      dotHeight: 10,
                      dotWidth: 10,
                      spacing: 20,
                      activeDotColor: Colours.primaryColor,
                    ),
                  ),
                ),

                // Positioned(
                //   bottom: 20,
                //   right: 20,
                //   child: ElevatedButton(
                //     onPressed: () {
                //       // if (currentPageIndex < 2) {
                //       //   // Navigate to the next page
                //       //   pageController.nextPage(
                //       //     duration: const Duration(milliseconds: 500),
                //       //     curve: Curves.easeInOut,
                //       //   );
                //       // } else {
                //       //   // Handle the action for the last page
                //       //   // For example, navigate to the home screen
                //       //   Navigator.pushReplacementNamed(context, '/home');
                //       // }

                //       pageController.nextPage(
                //         duration: const Duration(milliseconds: 500),
                //         curve: Curves.easeInOut,
                //       );
                //       if (pageController.page == 2) {
                //         CoreUtils.showSnackBar(context, 'This is last page');
                //       }
                //       setState(() {});
                //     },
                //     style: ElevatedButton.styleFrom(
                //       padding: const EdgeInsets.symmetric(
                //         horizontal: 20,
                //         vertical: 10,
                //       ),
                //       backgroundColor: Colours.primaryColor,
                //       foregroundColor: Colors.white,
                //     ),
                //     child: Text(
                //       pageController.page == 2 ? 'Get Started' : 'Next',
                //       style: const TextStyle(
                //         fontFamily: Fonts.aeonik,
                //         fontWeight: FontWeight.bold,
                //       ),
                //     ),
                //   ),
                // ),
              ],
            );
          },
        ),
      ),
    );
  }
}
