import 'package:flutter/material.dart';
import 'package:job_finder/app/routes/app_routes.dart';
import 'package:job_finder/view/theme/app_constants.dart';
import 'package:job_finder/view/height_spacer.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        color: Color(kDarkBlue.value),
        child: Column(
          children: [
            HeightSpacer(size: 80),
            Image.asset('assets/images/onBoardingPage2.png'),
            HeightSpacer(
              size: 70,
            ),
            Text(
              'Stable Yourself \n With Your Abilities',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Color(kLight.value),
                  fontSize: 45),
            ),
            HeightSpacer(size: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.00),
              child: Text(
                'We help you to find your dream job according to your skills and experience',
                textAlign: TextAlign.center,
                style: TextStyle(
                    wordSpacing: 3.00,
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Color(kLight.value)),
              ),
            ),
            HeightSpacer(size: 10),
            Text(
              'ALSO',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Color(kLight.value),
                  fontSize: 40),
            ),
            HeightSpacer(size: 10),
            Text(
              'We assist you in providing employment opportunities to others',
              textAlign: TextAlign.center,
              style: TextStyle(
                  wordSpacing: 3.00,
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: Color(kLight.value)),
            ),
            HeightSpacer(size: 50),
            InkWell(
                onTap: () {
                  Navigator.pushNamed(context, AppRoute.pagethreeRoute);
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(kDarkPurple.value)),
                  child: Center(
                    child: Text(
                      'Next',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color(kLight.value)),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
