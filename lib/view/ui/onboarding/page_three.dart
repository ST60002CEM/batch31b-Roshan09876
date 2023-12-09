import 'package:flutter/material.dart';
import 'package:job_finder/app/routes/app_routes.dart';
import 'package:job_finder/view/theme/app_constants.dart';
import 'package:job_finder/view/height_spacer.dart';
import 'package:job_finder/view/ui/register_view.dart';

class PageThree extends StatelessWidget {
  const PageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        color: Color(kLightBlue.value),
        child: Column(children: [
          HeightSpacer(size: 70),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              height: 400,
              child: Image.asset(
                'assets/images/onBoardingPage3.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          HeightSpacer(size: 30),
          Text(
            'Welcome to JobHub',
            style: TextStyle(
                wordSpacing: 4.00,
                fontSize: 40,
                fontWeight: FontWeight.w600,
                color: Color(kLight.value)),
          ),
          HeightSpacer(size: 20),
          Text(
            'We help you to find your job according to your skills and experience',
            textAlign: TextAlign.center,
            style: TextStyle(
                wordSpacing: 3.00,
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Color(kLight.value)),
          ),
          HeightSpacer(size: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoute.mainscreenRoute);
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
                  Navigator.pushNamed(context, AppRoute.mainscreenRoute);
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
          HeightSpacer(size: 40),
          Text('Best of Luck for your Journey',
              style: TextStyle(
                  color: Color(kLightGrey.value),
                  fontWeight: FontWeight.bold,
                  fontSize: 30))
        ]),
      ),
    );
  }
}
