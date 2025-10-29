import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:face_mentor/assetsgen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'features.dart';

class SplashScreen extends StatelessWidget {
  static const route = '/splash';
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        splash: FmAssests.images.logoLabelled.image(scale: 2),
        nextScreen: OnboardingPage(),
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.rightToLeftWithFade,
      ),
    );
  }
}
