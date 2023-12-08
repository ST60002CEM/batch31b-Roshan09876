import 'package:flutter/material.dart';
import 'package:job_finder/app/app.dart';
import 'package:job_finder/controller/onboarding_notifier.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    child: const MyApp(),
  ));
}
