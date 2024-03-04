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
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ReusableText(
                            text:
                                '${userState.currentUser.firstName} ${userState.currentUser.lastName}',
                            fontSize: 24,
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
                            text: 'Your Location',
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
                    text: '980124629',
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
                        primary: Color(kOrange.value),
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
}
