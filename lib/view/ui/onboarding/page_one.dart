import 'package:flutter/material.dart';
import 'package:job_finder/view/theme/app_constants.dart';
import 'package:job_finder/view/ui/drawer/height_spacer.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(kDarkPurple.value),
      body: Container(
        height: height,
        width: width,
        child: Column(children: [
          HeightSpacer(size: 60),
          Padding(
            padding: const EdgeInsets.only(right: 50),
            child: Image.asset('assets/images/onBoardingPage1.jpeg'),
          ),
          HeightSpacer(size: 20),
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Image.asset('assets/images/onBoardingPage1_second.jpeg'),
          ),
          HeightSpacer(size: 10),
          Column(
            children: [
              Container(
                  height: 200, child: Image.asset('assets/images/logo.png')),
              Text(
                'Find Your dream Job',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Color(kLight.value)),
                textAlign: TextAlign.center,
              ),
              HeightSpacer(size: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.00),
                child: Text(
                  "Certainly! If you're searching for a job that aligns with your skills and preferred location, we're here to help you find your dream opportunity.",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(kLight.value),
                      wordSpacing: 3.0),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}
