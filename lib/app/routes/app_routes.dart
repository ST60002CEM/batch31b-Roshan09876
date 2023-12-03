import 'package:job_finder/view/chat_view.dart';
import 'package:job_finder/view/dashboard_view.dart';
import 'package:job_finder/view/profile_view.dart';
import 'package:job_finder/view/register_view.dart';

class AppRoute{
  //Private Constructor
  AppRoute._();
  
  static const String dashboardviewRoute = '/dashboardviewRoute';
  static const String chatviewRoute = '/chatviewRoute';
  static const String profileviewRoute = '/profileviewRoute';

  static getApplicationRoute(){
    return{
      dashboardviewRoute: (context) => DashboardView(),
      chatviewRoute: (context) => ChatView(),
      profileviewRoute: (context) => ProfileView(),
    };
  }

}