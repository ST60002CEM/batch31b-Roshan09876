import 'package:flutter/material.dart';
import 'package:job_finder/view/chat_view.dart';
import 'package:job_finder/view/dashboard_view.dart';
import 'package:job_finder/view/profile_view.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;

//Making list for bottomnav through list 
  List<Widget> _widgetOption = <Widget>[
    ProfileView(),
    DashboardView(),
    ChatView()
  ];

//Making Function to call
  void _onItemtap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOption.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.blue,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          currentIndex: _selectedIndex,
          onTap: _onItemtap,
          iconSize: 28,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.verified_user), label: 'Profile'),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.chat), label: 'Chat'),
          ]),
    );
  }
}
