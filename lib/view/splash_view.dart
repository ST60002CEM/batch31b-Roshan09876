import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:job_finder/app/routes/bottom_nav.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: Lottie.asset('assets/images/job.json'),
        // Column(children: [
        //   Image.asset("assets/images/image3.jpeg"),
        //   Text('Job Finder App', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),)
        // ],),
        backgroundColor: const Color.fromARGB(255, 119, 151, 176),
        nextScreen: BottomNav(),
        splashIconSize: 400,
        duration: 3000,
        splashTransition: SplashTransition.scaleTransition,
        pageTransitionType: PageTransitionType.fade,
      );
  }
}