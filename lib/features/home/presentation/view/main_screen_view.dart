import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_finder/config/router/app_routes.dart';
import 'package:job_finder/config/constant/app_constants.dart';
import 'package:job_finder/config/constant/height_spacer.dart';
import 'package:job_finder/config/constant/reusable_text.dart';
import 'package:job_finder/features/auth/presentation/view/search/search_widget.dart';

class MainScreenView extends StatelessWidget {
  const MainScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Search \n Find & Apply',
                    style: GoogleFonts.openSans(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Color(kDark.value))),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoute.profileviewRoute);
                  },
                  child: ClipOval(
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/image3.jpeg'),
                              fit: BoxFit.cover)),
                    ),
                  ),
                ),
              ],
            ),
            HeightSpacer(size: 20.h),
            SearchWidget(
              onTap: () {},
            ),
            HeightSpacer(size: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ReusableText(
                    text: 'Popular Jobs',
                    fontSize: 20.00,
                    color: Color(kDark.value)),
                IconButton(onPressed: () {}, icon: Icon(Icons.menu_open))
              ],
            ),
            HeightSpacer(size: 40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ReusableText(
                    text: 'Recently Posted',
                    fontSize: 20.00,
                    color: Color(kDark.value)),
                IconButton(onPressed: () {}, icon: Icon(Icons.menu_open))
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
