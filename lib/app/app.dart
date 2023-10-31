import 'package:flutter/material.dart';
import 'package:job_finder/view/login_view.dart';
import 'package:job_finder/view/signup_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUp(),
    );
  }
}