import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_finder/config/router/app_routes.dart';
import 'package:job_finder/config/constant/app_constants.dart';
import 'package:job_finder/config/constant/height_spacer.dart';
import 'package:job_finder/config/constant/reusable_text.dart';
import 'package:job_finder/features/home/popular_job.dart';
import 'package:job_finder/features/home/search_widget.dart';
import 'package:job_finder/features/pagination/presentation/view/jobs_view.dart';
import 'package:job_finder/features/pagination/presentation/view_model/job_view_model.dart';
import 'package:job_finder/features/search/presentation/view/search_page_view.dart';

class MainScreenView extends ConsumerStatefulWidget {
  const MainScreenView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainScreenViewState();
}

class _MainScreenViewState extends ConsumerState<MainScreenView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(jobViewModelProvider.notifier).resetState();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(jobViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'JOB  PORTAL',
        ),
        backgroundColor: Color(kDark.value),
      ),
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SearchPageView()));
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
              ReusableText(
                  text: 'Recently Posted Jobs',
                  fontSize: 15,
                  color: Color(kDark.value)),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: state.jobApiModel.map((jobs) {
                    return Padding(
                      padding: const EdgeInsets.all(2),
                      child: Card(
                        elevation: 4.0,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  jobs.title.toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                  ),
                                ),
                                SizedBox(height: 8.0),
                                Text(
                                  jobs.description!.length > 100
                                      ? '${jobs.description!.substring(0, 100)}...'
                                      : jobs.description.toString(),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 8.0),
                                Text(
                                  jobs.salary.toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                    color: Colors.orange,
                                  ),
                                ),
                                SizedBox(height: 8.0),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(kOrange.value)),
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      AppRoute.jobsviewDetail,
                                      arguments: jobs,
                                    );
                                  },
                                  child: Text('View Details'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}




















// class MainScreenView extends StatelessWidget {
//   const MainScreenView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final state = ref.watch(jobViewModelProvider);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'JOB  PORTAL',
//         ),
//         backgroundColor: Color(kDark.value),
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(18.0),
//           child: SingleChildScrollView(
//             child: Column(children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text('Search \n Find & Apply',
//                       style: GoogleFonts.openSans(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 40,
//                           color: Color(kDark.value))),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.pushNamed(context, AppRoute.profileviewRoute);
//                     },
//                     child: ClipOval(
//                       child: Container(
//                         height: 50,
//                         width: 50,
//                         decoration: BoxDecoration(
//                             image: DecorationImage(
//                                 image: AssetImage('assets/images/image3.jpeg'),
//                                 fit: BoxFit.cover)),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               HeightSpacer(size: 20.h),
//               SearchWidget(
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => SearchPageView()));
//                 },
//               ),
//               HeightSpacer(size: 20.h),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   ReusableText(
//                       text: 'Popular Jobs',
//                       fontSize: 20.00,
//                       color: Color(kDark.value)),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.push(context,
//                           MaterialPageRoute(builder: (context) => JobsView()));
//                     },
//                     child: ReusableText(
//                         text: 'View All',
//                         fontSize: 18,
//                         color: Color(kDark.value)),
//                   )
//                 ],
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               SizedBox(
//                 height: height * 0.20,
//                 child: ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     itemCount: 4,
//                     itemBuilder: (context, index) {
//                       return Padding(
//                         padding: const EdgeInsets.only(right: 19),
//                         child: PopularJob(
//                           onTap: () {},
//                         ),
//                       );
//                     }),
//               ),
//               HeightSpacer(size: 10.h),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   ReusableText(
//                       text: 'Recently Posted',
//                       fontSize: 20.00,
//                       color: Color(kDark.value)),
//                   IconButton(onPressed: () {}, icon: Icon(Icons.menu_open))
//                 ],
//               ),
//               SizedBox(
//                 height: height * 0.20,
//                 child: ListView.builder(
//                   itemCount: state.jobApiModel.length,
//                   itemBuilder: (context, index) {
//                     final jobs = state.jobApiModel[index];
//                     return Padding(
//                       padding: const EdgeInsets.symmetric(
//                           vertical: 8.0, horizontal: 16.0),
//                       child: Card(
//                         elevation: 4.0,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             ListTile(
//                               // leading: Text(jobs.id.toString()),
//                               title: Padding(
//                                   padding: const EdgeInsets.only(bottom: 10),
//                                   child: ReusableText(
//                                       text: jobs.title,
//                                       fontSize: 25,
//                                       color: Color(kDark.value))),
//                               subtitle: Text(jobs.description.length > 100
//                                   ? '${jobs.description.substring(0, 150)}...'
//                                   : jobs.description),
//                               trailing: ReusableText(
//                                   text: jobs.salary,
//                                   fontSize: 15,
//                                   color: Color(kOrange.value)),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(18.0),
//                               ),
//                             ),
//                             SizedBox(
//                                 height:
//                                     10), // Add some space between subtitle and button
//                             Align(
//                               alignment: Alignment.center,
//                               child: SizedBox(
//                                 width: double.infinity,
//                                 child: ElevatedButton(
//                                     style: ElevatedButton.styleFrom(
//                                         backgroundColor: Color(kOrange.value)),
//                                     onPressed: () {
//                                       Navigator.pushNamed(
//                                           context, AppRoute.jobsviewDetail,
//                                           arguments: state.jobApiModel[index]);
//                                     },
//                                     child: Text(
//                                       'View  Details',
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 15),
//                                     )),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ]),
//           ),
//         ),
//       ),
//     );
//   }
// }