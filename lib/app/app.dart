import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_finder/app/routes/app_routes.dart';
import 'package:job_finder/view/dashboard_view.dart';
import 'package:job_finder/view/theme/themedata.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getApplicationTheme(),
      home: DashboardView(),
      initialRoute: AppRoute.hiddendrawerRoute,
      routes: AppRoute.getApplicationRoute(),
    );
  }
}
