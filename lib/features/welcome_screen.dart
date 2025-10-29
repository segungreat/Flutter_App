import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  static const route = '/welcome';
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final fmTheme = Theme.of(context);

    final topPadding = MediaQuery.of(context).padding.top;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16).copyWith(top: topPadding + 30),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 250, 248, 228), // light yellow
            Color(0xFFFFFFFF), // white
          ],
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              children: [
                FmAssests.images.logoLabelled.image(
                  scale: 2,
                ),
                Gap(Get.height * 0.1),
                SizedBox(
                  height: Get.height * 0.32,
                  child: PageView.builder(
                      controller: _pageController,
                      onPageChanged: (index) {
                        currentPage = index;
                        setState(() {});
                      },
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return FmAssests.images.onboardingImage.image(
                          scale: 2,
                        );
                      }),
                ),
                Gap(Get.height * 0.04),
                SmoothPageIndicator(
                  controller: _pageController,
                  count: 3,
                  effect: ExpandingDotsEffect(
                      dotColor: Color(0xffEEEFF1),
                      activeDotColor: fmTheme.primaryColor,
                      dotHeight: 8,
                      dotWidth: 8,
                      radius: 80),
                ),
                Gap(Get.height * 0.05),
                Text(onboardingData[currentPage]['title'].toString(), style: fmTheme.textTheme.titleMedium),
                Gap(10),
                Text(onboardingData[currentPage]['description'].toString(),
                    textAlign: TextAlign.center, style: fmTheme.textTheme.bodyMedium),
                Gap(Get.height * 0.05),
                FmButton(
                  text: "Create account",
                  onPressed: () {
                    FmNav.toNamed(ChooseTypePage.route);
                  },
                ),
                Gap(Get.height * 0.02),
                FmButton(
                  text: "Login",
                  looksDisabled: true,
                  onPressed: () {},
                ),
                Gap(Get.height * 0.03),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'By continuing, you agree to our ',
                        style: TextStyle(
                          color: const Color(0x7F1F144D),
                          fontSize: 12,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          height: 1.50,
                        ),
                      ),
                      TextSpan(
                        text: 'Terms Of Use.',
                        style: TextStyle(
                          color: const Color(0x7F1F144D),
                          fontSize: 12,
                          decoration: TextDecoration.underline,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          height: 1.50,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          )),
    );
  }
}
