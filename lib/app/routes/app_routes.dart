import 'package:job_finder/view/ui/bottomnav/bottom_nav_dashboard_view.dart';
import 'package:job_finder/view/chat_view.dart';
import 'package:job_finder/view/ui/screens/main_screen_view.dart';
import 'package:job_finder/view/ui/screens/first_page.dart';
import 'package:job_finder/view/ui/screens/splash_screen.dart';
import 'package:job_finder/view/ui/screens/login_view.dart';
import 'package:job_finder/view/profile_view.dart';
import 'package:job_finder/view/ui/screens/register_view.dart';

class AppRoute {
  //Private Constructor
  AppRoute._();

  static const String splashscreenRoute = '/splashscreenRoute';
  static const String firstpageRoute = '/firstpageRoute';
  static const String loginviewRoute = '/loginviewRoute';
  static const String registerviewRoute = '/registerviewRoute';
  static const String bottomnavDashboardRoute = '/bottomnavDashboardRoute';
  static const String mainscreenRoute = '/mainscreenRoute';
  static const String chatviewRoute = '/chatviewRoute';
  static const String profileviewRoute = '/profileviewRoute';

  static getApplicationRoute() {
    return {
      splashscreenRoute: (context) => SplashScreen(),
      firstpageRoute: (context) => FirstPage(),
      loginviewRoute: (context) => LoginView(),
      registerviewRoute: (context) => RegisterView(),
      bottomnavDashboardRoute: (context) => BottomNavDashboardView(),
      mainscreenRoute: (context) => MainScreenView(),
      chatviewRoute: (context) => ChatView(),
      profileviewRoute: (context) => ProfileView(),
    };
  }
}
