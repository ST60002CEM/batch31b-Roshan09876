import 'package:flutter/material.dart';
import 'package:job_finder/app/routes/app_routes.dart';
import 'package:job_finder/app/routes/bottom_nav.dart';
import 'package:job_finder/view/chat_view.dart';
import 'package:job_finder/view/dashboard_view.dart';
import 'package:job_finder/view/login_view.dart';
import 'package:job_finder/view/profile_view.dart';
import 'package:job_finder/view/signup_view.dart';
import 'package:job_finder/view/splash_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen()
    );
  }
}