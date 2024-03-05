
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:job_finder/config/constant/app_constants.dart';
import 'package:job_finder/config/constant/reusable_text.dart';
import 'package:job_finder/core/shared_pref/user_shared_pref.dart';
import 'package:job_finder/features/pagination/presentation/state/job_state.dart';
import 'package:job_finder/features/pagination/presentation/view_model/job_view_model.dart';

class AppliesJobs extends ConsumerStatefulWidget {
  const AppliesJobs({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppliesJobsState();
}

class _AppliesJobsState extends ConsumerState<AppliesJobs> {
  @override
  void initState() {
    super.initState();
    fetchAppliedJobs(); 
  }

  Future<void> fetchAppliedJobs() async {
    final userSharedPref = ref.read(userSharedPrefsProvider);
    final userId = await userSharedPref.getUserId();
    userId.fold(
      (l) => null,
      (r) {
        ref
            .read(jobViewModelProvider.notifier)
            .getAppliedJobs(r!); // Pass userId to getAppliedJobs
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Applied Jobs'),
      ),
      body: Consumer(
        builder: (context, watch, child) {
          final state = ref.watch(jobViewModelProvider);
          if (state.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else {
            return _buildJobList(state);
          }
        },
      ),
    );
  }

  Widget _buildJobList(JobState state) {
    return ListView.builder(
      itemCount: state.jobApiModel.length,
      itemBuilder: (context, index) {
        final job = state.jobApiModel[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Card(
            elevation: 4.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: ReusableText(
                      text: job.title.toString(),
                      fontSize: 25,
                      color: Color(kDark.value),
                    ),
                  ),
                  subtitle: Text(
                    job.description!.length > 100
                        ? '${job.description!.substring(0, 150)}...'
                        : job.description.toString(),
                  ),
                  trailing: ReusableText(
                    text: job.salary.toString(),
                    fontSize: 15,
                    color: Color(kOrange.value),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(kOrange.value),
                      ),
                      onPressed: () {
                        // Navigate to job detail page
                        // Navigator.pushNamed(
                        //   context,
                        //   AppRoute.jobsviewDetail,
                        //   arguments: job,
                        // );
                      },
                      child: Text(
                        'View Details',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:job_finder/config/constant/app_constants.dart';
// import 'package:job_finder/config/constant/reusable_text.dart';
// import 'package:job_finder/core/shared_pref/user_shared_pref.dart';
// import 'package:job_finder/features/pagination/presentation/view_model/job_view_model.dart';

// class AppliesJobs extends ConsumerStatefulWidget {
//   const AppliesJobs({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _AppliesJobsState();
// }

// class _AppliesJobsState extends ConsumerState<AppliesJobs> {
//   @override
//   void initState() {
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       final userSharedPref = ref.read(userSharedPrefsProvider);
//       userSharedPref.getUserId().then((value) => value.fold((l) => null, (r) {
//             if (r != null) {
//               ref
//                   .read(jobViewModelProvider.notifier)
//                   .getAppliedJobs(r); // Pass userId to getAppliedJobs
//             }
//           }));
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final state = ref.watch(jobViewModelProvider);
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: Text('Applied Jobs'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: state.jobApiModel.length,
//               itemBuilder: (context, index) {
//                 final jobs = state.jobApiModel[index];
//                 return Padding(
//                   padding: const EdgeInsets.symmetric(
//                       vertical: 8.0, horizontal: 16.0),
//                   child: Card(
//                     elevation: 4.0,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         ListTile(
//                           title: Padding(
//                               padding: const EdgeInsets.only(bottom: 10),
//                               child: ReusableText(
//                                   text: jobs.title,
//                                   fontSize: 25,
//                                   color: Color(kDark.value))),
//                           subtitle: Text(jobs.description.length > 100
//                               ? '${jobs.description.substring(0, 150)}...'
//                               : jobs.description),
//                           trailing: ReusableText(
//                               text: jobs.salary,
//                               fontSize: 15,
//                               color: Color(kOrange.value)),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(18.0),
//                           ),
//                         ),
//                         SizedBox(
//                             height:
//                                 10), // Add some space between subtitle and button
//                         Align(
//                           alignment: Alignment.center,
//                           child: SizedBox(
//                             width: double.infinity,
//                             child: ElevatedButton(
//                                 style: ElevatedButton.styleFrom(
//                                     backgroundColor: Color(kOrange.value)),
//                                 onPressed: () {
//                                   // Navigator.pushNamed(
//                                   //     context, AppRoute.jobsviewDetail,
//                                   //     arguments:
//                                   //         state.jobApiModel[index]);
//                                 },
//                                 child: Text(
//                                   'View  Details',
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 15),
//                                 )),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }