import 'package:job_finder/view/chat_view.dart';
import 'package:job_finder/view/dashboard_view.dart';
import 'package:job_finder/view/ui/login_view.dart';
import 'package:job_finder/view/ui/onboarding/onboardingscreen.dart';
import 'package:job_finder/view/profile_view.dart';
import 'package:job_finder/view/ui/onboarding/page_three.dart';
import 'package:job_finder/view/ui/onboarding/page_two.dart';
import 'package:job_finder/view/ui/register_view.dart';

class AppRoute {
  //Private Constructor
  AppRoute._();

  static const String onBoardingScreenRoute = '/onBoardingScreenRoute';
  static const String loginviewRoute = '/loginviewRoute';
  static const String registerviewRoute = '/registerviewRoute';
  static const String pagethreeRoute = '/pagethreeRoute';
  static const String dashboardviewRoute = '/dashboardviewRoute';
  static const String chatviewRoute = '/chatviewRoute';
  static const String profileviewRoute = '/profileviewRoute';

  static getApplicationRoute() {
    return {
      onBoardingScreenRoute: (context) => OnBoardingScreen(),
      loginviewRoute: (context) => LoginView(),
      registerviewRoute: (context) => RegisterView(),
      pagethreeRoute: (context) => PageThree(),
      dashboardviewRoute: (context) => DashboardView(),
      chatviewRoute: (context) => ChatView(),
      profileviewRoute: (context) => ProfileView(),
    };
  }
}
