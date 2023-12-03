import 'package:job_finder/view/login_view.dart';
import 'package:job_finder/view/register_view.dart';

class AppRoute{
  //Private Constructor
  AppRoute._();
  
  static const String loginRoute = '/loginRoute';
  static const String registerRoute = '/registerRoute';

  static getApplicationRoute(){
    return{
      loginRoute: (context) => LoginView(),
      registerRoute: (context) => RegisterView(),
    };
  }

}