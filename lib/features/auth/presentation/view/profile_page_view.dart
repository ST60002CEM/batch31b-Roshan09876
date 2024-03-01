import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:job_finder/config/constant/app_constants.dart';
import 'package:job_finder/config/constant/reusable_text.dart';
import 'package:job_finder/features/auth/presentation/view_model/auth_view_model.dart';

class ProfilePageView extends ConsumerStatefulWidget {
  const ProfilePageView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProfilePageViewState();
}

class _ProfilePageViewState extends ConsumerState<ProfilePageView> {
  @override
  Widget build(BuildContext context) {
    var userState = ref.watch(authViewModelProvider);

    return Scaffold(
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
        padding: const EdgeInsets.all(8), // Increased padding
        child: Card(
          elevation: 4.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // CircleAvatar(
                    //   radius: 50,
                    //   backgroundImage: AssetImage(
                    //       // 'assets/profile_image.png'), // Add your profile image
                    // ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ReusableText(
                          text: userState.currentUser
                              .firstName, // Combine first name and last name
                          fontSize: 20,
                          color: Color(kDark.value), // Make the name bold
                        ),
                        ReusableText(
                          text:
                              'Professional Title', // Add a professional title
                          fontSize: 16,
                          color: Color(kDark.value),
                        ),
                        SizedBox(height: 5),
                        ReusableText(
                          text: userState.currentUser.lastName, // Add location
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
                  text: '+1234567890',
                  fontSize: 16,
                  color: Color(kDark.value),
                ),
                SizedBox(
                  height: 10,
                ),
                ReusableText(
                  text: 'Address',
                  fontSize: 20,
                  color: Color(kDark.value),
                ),
                ReusableText(
                  text: '123 Street, City, Country',
                  fontSize: 16,
                  color: Color(kDark.value),
                ),
                IconButton(
                    onPressed: () {
                      ref.read(authViewModelProvider.notifier).logout(context);
                    },
                    icon: Icon(Icons.logout))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
