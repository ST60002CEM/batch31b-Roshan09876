import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_finder/app/routes/app_routes.dart';
import 'package:job_finder/app/theme/constant/height_spacer.dart';
import 'package:job_finder/app/theme/constant/app_constants.dart';
import 'package:job_finder/app/theme/reusable_text.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(kDarkPurple.value),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: SafeArea(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(right: 50),
              child: Image.asset('assets/images/onBoardingPage1.jpeg'),
            ),
            HeightSpacer(size: 10.h),
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: Image.asset('assets/images/onBoardingPage1_second.jpeg'),
            ),
            HeightSpacer(size: 30.h),
            ReusableText(text: "Let's \n Get Started", fontSize: 28, color: Color(kLight.value)),
            HeightSpacer(size: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.00),
              child: Text(
                "Certainly! If you're searching for a job that aligns with your skills and preferred location, we're here to help you find your dream opportunity.",
                style: GoogleFonts.openSans(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color(kLight.value),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            HeightSpacer(size: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoute.registerviewRoute);
                  },
                  style: OutlinedButton.styleFrom(
                    minimumSize: Size(160, 60),
                    side: BorderSide(
                        color: Color(kLight.value)), // White outline color
                  ),
                  child: Text(
                    'As a Admin',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Text color
                    ),
                  ),
                ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoute.registerviewRoute);
                  },
                  style: OutlinedButton.styleFrom(
                    minimumSize: Size(160, 60),
                    side: BorderSide(
                        color: Color(kLight.value)), // White outline color
                  ),
                  child: Text(
                    'As a Freelancer',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Text color
                    ),
                  ),
                ),
              ],
            ),
            HeightSpacer(size: 20.h),
            Text('Best of Luck for your Journey',
                style: TextStyle(
                    color: Color(kLightGrey.value),
                    fontWeight: FontWeight.bold,
                    fontSize: 30))
          ]),
        ),
      ),
    );
  }
}
