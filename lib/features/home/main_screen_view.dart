import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_finder/config/router/app_routes.dart';
import 'package:job_finder/config/constant/app_constants.dart';
import 'package:job_finder/config/constant/height_spacer.dart';
import 'package:job_finder/config/constant/reusable_text.dart';
import 'package:job_finder/features/home/popular_job.dart';
import 'package:job_finder/features/home/search_widget.dart';
import 'package:job_finder/features/pagination/presentation/view/jobs_view.dart';
import 'package:job_finder/features/view/search_page.dart';

class MainScreenView extends StatelessWidget {
  const MainScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SingleChildScrollView(
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
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SearchPage()));
                },
              ),
              HeightSpacer(size: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ReusableText(
                      text: 'Popular Jobs',
                      fontSize: 20.00,
                      color: Color(kDark.value)),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => JobsView()));
                    },
                    child: ReusableText(
                        text: 'View All',
                        fontSize: 18,
                        color: Color(kDark.value)),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: height * 0.20,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 19),
                        child: PopularJob(
                          onTap: () {},
                        ),
                      );
                    }),
              ),
              HeightSpacer(size: 10.h),
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
      ),
    );
  }
}
