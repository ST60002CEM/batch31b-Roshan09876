import 'package:flutter/material.dart';
import 'package:job_finder/controller/onboarding_notifier.dart';
import 'package:job_finder/view/theme/app_constants.dart';
import 'package:job_finder/view/ui/onboarding/page_one.dart';
import 'package:job_finder/view/ui/onboarding/page_three.dart';
import 'package:job_finder/view/ui/onboarding/page_two.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<OnBoardNotifier>(
      builder: (context, OnBoardNotifier, child) {
        //Below code is to check the index 2 page whether it is true or false
        // print(OnBoardNotifier.isLastPage);
        return Stack(
          children: [
            PageView(
              controller: pageController,
              physics: OnBoardNotifier.isLastPage
                  ? NeverScrollableScrollPhysics()
                  : AlwaysScrollableScrollPhysics(),
              onPageChanged: (page) {
                OnBoardNotifier.isLastPage = page == 2;
              },
              children: [PageOne(), PageTwo(), PageThree()],
            ),
            OnBoardNotifier.isLastPage
                ? SizedBox.shrink()
                : Positioned(
                    bottom: 40,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: SmoothPageIndicator(
                        controller: PageController(),
                        count: 3,
                        effect: WormEffect(
                            dotColor: Color(kLight.value),
                            activeDotColor: Color(kOrange.value),
                            dotHeight: 12,
                            dotWidth: 12,
                            spacing: 10),
                      ),
                    )),
            OnBoardNotifier.isLastPage
                ? SizedBox.shrink()
                : Positioned(
                    child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 30),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                pageController.animateTo(2,
                                    duration: Duration(
                                      microseconds: 100,
                                    ),
                                    curve: Curves.ease);
                              },
                              child: Text(
                                'Skip',
                                style: TextStyle(
                                    fontSize: 18, color: Color(kLight.value)),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                pageController.nextPage(
                                    duration: Duration(microseconds: 100),
                                    curve: Curves.ease);
                              },
                              child: Text(
                                'Next',
                                style: TextStyle(
                                    fontSize: 18, color: Color(kLight.value)),
                              ),
                            ),
                          ]),
                    ),
                  )),
          ],
        );
      },
    ));
  }
}
