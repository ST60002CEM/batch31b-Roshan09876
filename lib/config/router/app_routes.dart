import 'package:job_finder/features/home/presentation/view/bottomnav/home_view.dart';
import 'package:job_finder/chat_view.dart';
import 'package:job_finder/features/home/presentation/view/main_screen_view.dart';
import 'package:job_finder/features/view/ui/screens/first_page.dart';
import 'package:job_finder/features/splash/splash_screen.dart';
import 'package:job_finder/profile_view.dart';

class AppRoute {
  //Private Constructor
  AppRoute._();

  static const String splashscreenRoute = '/splashscreenRoute';
  static const String firstpageRoute = '/firstpageRoute';
  static const String loginviewRoute = '/loginviewRoute';
  static const String registerviewRoute = '/registerviewRoute';
  static const String homeViewRoute = '/homeViewRoute';
  static const String mainscreenRoute = '/mainscreenRoute';
  static const String chatviewRoute = '/chatviewRoute';
  static const String profileviewRoute = '/profileviewRoute';

  static getApplicationRoute() {
    return {
      splashscreenRoute: (context) => SplashScreen(),
      firstpageRoute: (context) => FirstPage(),
      // loginviewRoute: (context) => LoginView(),
      // registerviewRoute: (context) => RegisterView(),
      homeViewRoute: (context) => HomeView(),
      mainscreenRoute: (context) => MainScreenView(),
      chatviewRoute: (context) => ChatView(),
      profileviewRoute: (context) => ProfileView(),
    };
  }
}
