import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:job_finder/config/constant/app_constants.dart';
import 'package:job_finder/config/constant/reusable_text.dart';
import 'package:job_finder/features/pagination/presentation/view_model/job_view_model.dart';
import 'package:job_finder/features/search/data/model/search_api_model.dart';

class SearchShowScreen extends ConsumerStatefulWidget {
  final SearchApiModel jobs;
  const SearchShowScreen({Key? key, required this.jobs}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => SearchShowScreenState();
}

class SearchShowScreenState extends ConsumerState<SearchShowScreen> {
  
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(jobViewModelProvider);
    // var jobs  = ModalRoute.of(context)!.settings.arguments as SearchApiModel;

    return Scaffold(
      appBar: AppBar(
        title: ReusableText(
            text: 'Details of the Job',
            fontSize: 20,
            color: Color(kLight.value)),
        backgroundColor: Color(kDark.value),
        elevation: 0, // Remove app bar elevation
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(Icons.bookmark),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30), // Adjusted padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReusableText(
                text: '${widget.jobs.title}', fontSize: 36, color: Color(kDark.value)), // Increased font size and added bold
            SizedBox(
              height: 10,
            ),
            ReusableText(
                text: 'Job Description',
                fontSize: 24, // Adjusted font size
               // Added bold
                color: Color(kDark.value)),
            SizedBox(
              height: 5,
            ),
            ReusableText(
                text:
                    '${widget.jobs.description}',
                fontSize: 16,
                color: Color(kDark.value)),
            SizedBox(
              height: 20,
            ),
            // ReusableText(
            //     text: 'Salary', fontSize: 24, color: Color(kDark.value)), // Added bold
            SizedBox(
              height: 5,
            ),
            ReusableText(
                text: '${widget.jobs.salary}',
                fontSize: 16,
                color: Color(kOrange.value)),
            SizedBox(
              height: 20,
            ),
            // ReusableText(
            //     text: 'Location', fontSize: 24, color: Color(kDark.value)), // Added bold
            // SizedBox(
            //   height: 5,
            // ),
            // ReusableText(
            //     text: '${jobs.location}', fontSize: 16, color: Color(kOrange.value)),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Color(kOrange.value),
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: SizedBox(
                width: double.infinity,
                child: Center(
                  child: Text(
                    'Apply Now',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
