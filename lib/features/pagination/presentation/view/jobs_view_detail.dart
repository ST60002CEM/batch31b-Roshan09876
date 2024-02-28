import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:job_finder/config/constant/app_constants.dart';
import 'package:job_finder/config/constant/reusable_text.dart';
import 'package:job_finder/features/pagination/data/model/job_api_model.dart';
import 'package:job_finder/features/pagination/presentation/view_model/job_view_model.dart';

class JobsViewDetail extends ConsumerStatefulWidget {
  const JobsViewDetail({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _JobsViewDetailState();
}

class _JobsViewDetailState extends ConsumerState<JobsViewDetail> {
  
  
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(jobViewModelProvider);
    var jobs  = ModalRoute.of(context)!.settings.arguments as JobApiModel;

    return Scaffold(
      appBar: AppBar(
        title: ReusableText(
            text: 'Details of the Job',
            fontSize: 20,
            color: Color(kLight.value)),
        backgroundColor: Color(kDark.value),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20), // Adjusted padding
            child: Icon(Icons.bookmark),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20), // Added more padding
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align items to the start
          children: [
            ReusableText(
                text: '${jobs.title}', fontSize: 45, color: Color(kDark.value)),
            SizedBox(
              height: 10, // Reduced height
            ),
            ReusableText(
                text: 'Job Description',
                fontSize: 30, // Adjusted font size
                color: Color(kDark.value)),
            SizedBox(
              height: 5, // Reduced height
            ),
            ReusableText(
                text:
                    'iwebfriw berpio ubweporub fweopurb opcubwr gpowub rpolwu',
                fontSize: 15,
                color: Color(kDark.value)),
            SizedBox(
              height: 20,
            ),
            ReusableText(
                text: 'Salary', fontSize: 30, color: Color(kDark.value)),
            SizedBox(
              height: 5, // Reduced height
            ),
            ReusableText(
                text: '34567iobwde fv owebfv89',
                fontSize: 15,
                color: Color(kOrange.value)),
            SizedBox(
              height: 20,
            ),
            ReusableText(
                text: 'Location', fontSize: 30, color: Color(kDark.value)),
            SizedBox(
              height: 5, // Reduced height
            ),
            ReusableText(
                text: 'wow', fontSize: 15, color: Color(kOrange.value)),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding:
                      const EdgeInsets.only(bottom: 20), // Adjusted padding
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(width, 70),
                            backgroundColor: Color(kOrange.value)),
                        onPressed: () {},
                        child: Text(
                          'Apply  Now',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        )),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
