import 'package:flutter/material.dart';
import 'package:job_finder/view/main_screen_view.dart';
import 'package:job_finder/view/profile/profile_page.dart';
import 'package:job_finder/view/ui/drawer/drawer_screen.dart';

class HiddenDrawer extends StatelessWidget {
  const HiddenDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        DrawerScreen(),
        MainScreenView()
      ]),
    );
  }
}


















































// import 'package:flutter/material.dart';
// import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
// import 'package:job_finder/view/main_screen_view.dart';
// import 'package:job_finder/view/profile/profile_page.dart';
// import 'package:job_finder/view/theme/app_constants.dart';

// class HiddenDrawer extends StatefulWidget {
//   const HiddenDrawer({super.key});

//   @override
//   State<HiddenDrawer> createState() => _HiddenDrawerState();
// }

// class _HiddenDrawerState extends State<HiddenDrawer> {
//   final _myTextStyle = TextStyle(
//       fontWeight: FontWeight.bold, fontSize: 22, color: Color(kLight.value));

//   List<ScreenHiddenDrawer> _pages = [];

//   @override
//   void initState() {
//     super.initState();
//     _pages = [
//       ScreenHiddenDrawer(
//           ItemHiddenMenu(
//             name: 'HomePage',
//             baseStyle: _myTextStyle,
//             selectedStyle: _myTextStyle,
//           ),
//           MainScreenView()),
//       ScreenHiddenDrawer(
//           ItemHiddenMenu(
//               name: 'Profile',
//               baseStyle: _myTextStyle,
//               selectedStyle: _myTextStyle),
//           ProfilePage()),
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: HiddenDrawerMenu(
//         backgroundColorMenu: Color(kLightBlue.value),
//         screens: _pages,
//         initPositionSelected: 0,
//         slidePercent: 40,
//       ),
//     );
//   }
// }