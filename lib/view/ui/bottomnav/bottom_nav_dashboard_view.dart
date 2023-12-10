import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:job_finder/view/bookmarks/bookmarks_page.dart';
import 'package:job_finder/view/chat/chat_list.dart';
import 'package:job_finder/view/ui/screens/main_screen_view.dart';
import 'package:job_finder/view/profile/profile_page.dart';
import 'package:job_finder/app/theme/constant/app_constants.dart';

class BottomNavDashboardView extends StatefulWidget {
  const BottomNavDashboardView({super.key});

  @override
  State<BottomNavDashboardView> createState() => _BottomNavDashboardViewState();
}

class _BottomNavDashboardViewState extends State<BottomNavDashboardView> {
  int _selectindex = 0;

  List<Widget> lstBottomScreen = [
    MainScreenView(),
    BookMarksPage(),
    ChatListPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: lstBottomScreen[_selectindex],
      bottomNavigationBar: Container(
        color: Color(kDark.value),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: GNav(
            backgroundColor: Color(kDark.value),
            color: Color(kLight.value),
            activeColor: Color(kLight.value),
            tabBackgroundColor: const Color.fromARGB(255, 19, 17, 17),
            gap: 20,
            tabs: [
            GButton(onPressed: (){
              _onNavItemTapped(0);
            }, icon: Icons.home, text: 'Home',),
            GButton(onPressed: (){
              _onNavItemTapped(1);
            }, icon: Icons.bookmark, text: 'Marks',),
            GButton(onPressed: (){
              _onNavItemTapped(2);
            },icon: Icons.chat, text: 'Chat',),
            GButton(onPressed: (){
              _onNavItemTapped(3);
            },icon: Icons.verified_user, text: 'Profile',),
          ]),
        ),
      ),
    );
  }
    void _onNavItemTapped(int index) {
    setState(() {
      _selectindex = index;
    });
  }
}


