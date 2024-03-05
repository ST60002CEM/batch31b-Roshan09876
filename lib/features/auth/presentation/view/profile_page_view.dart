import 'dart:async';

import 'package:all_sensors2/all_sensors2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:job_finder/config/constant/app_constants.dart';
import 'package:job_finder/config/constant/reusable_text.dart';
import 'package:job_finder/features/auth/presentation/view_model/auth_view_model.dart';

class ProfilePageView extends ConsumerStatefulWidget {
  const ProfilePageView({Key? key}) : super(key: key);

  @override
  _ProfilePageViewState createState() => _ProfilePageViewState();
}

class _ProfilePageViewState extends ConsumerState<ProfilePageView> {
  final List<StreamSubscription<dynamic>> _streamSubscriptions =
      <StreamSubscription<dynamic>>[];

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  double _proximityValue = 0;
  

  @override
  void initState() {
    super.initState();
   
    _streamSubscriptions.add(
      proximityEvents!.listen((ProximityEvent event) {
        setState(() {
          _proximityValue = event.proximity;
        });

        // Check for a double tap on proximity
        if (_proximityValue == 0) {
          // Trigger logout when double-tapped
          _showLogoutConfirmation();
        }
      }),
    );
  }

  @override
  void dispose() {
    for (var subscription in _streamSubscriptions) {
      subscription.cancel();
      
    }
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var userState = ref.watch(authViewModelProvider);

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/login.png'), fit: BoxFit.cover),
          gradient: LinearGradient(
              colors: [Color(kLight.value), Color(kLightGrey.value)])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Color(kDark.value),
            title: Center(
              child: ReusableText(
                text: 'Profile',
                fontSize: 20,
                color: Color(kLight.value),
              ),
            ),
          ),
          body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 160,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        child: Icon(
                          Icons.person,
                          size: 50,
                          color: Colors.white,
                        ),
                        radius: 40,
                        backgroundColor: Colors.black,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ReusableText(
                            text:
                                '${userState.currentUser.firstName} ${userState.currentUser.lastName}',
                            fontSize: 22,
                            color: Color(kDark.value),
                            // fontWeight: FontWeight.bold, // Make the name bold
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          ReusableText(
                            text: 'Location', // Add location
                            fontSize: 16,
                            color: Color(kDark.value),
                          ),
                          ReusableText(
                            text: userState.currentUser.location,
                            fontSize: 16,
                            color: Color(kDark.value),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ReusableText(
                    text: 'Email',
                    fontSize: 20,
                    color: Color(kDark.value),
                  ),
                  ReusableText(
                    text: userState.currentUser.email,
                    fontSize: 16,
                    color: Color(kDark.value),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ReusableText(
                    text: 'Phone',
                    fontSize: 20,
                    color: Color(kDark.value),
                  ),
                  ReusableText(
                    text: userState.currentUser.phoneNum,
                    fontSize: 16,
                    color: Color(kDark.value),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(kOrange.value),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      onPressed: () {
                        ref
                            .read(authViewModelProvider.notifier)
                            .logout(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Log Out',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Icon(Icons.logout),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
    );
  }
  void _showLogoutConfirmation() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout Confirmation'),
          content: const Text('Do you want to logout?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }
}
