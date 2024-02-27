import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:job_finder/config/constant/app_constants.dart';
import 'package:job_finder/features/pagination/presentation/view_model/job_view_model.dart';

class JobsView extends ConsumerStatefulWidget {
  const JobsView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _JobsViewState();
}

class _JobsViewState extends ConsumerState<JobsView> {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(jobViewModelProvider);
    return NotificationListener(
      onNotification: (notification) {
        if (notification is ScrollEndNotification) {
          if (scrollController.position.extentAfter == 0) {
            ref.read(jobViewModelProvider.notifier).getJobs();
          }
        }
        return true;
      },
      child: Scaffold(
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     ref.read(jobViewModelProvider.notifier).getJobs();
        //   },
        //   child: Icon(Icons.downhill_skiing),
        // ),
        appBar: AppBar(
          title: Text('Jobs'),
          backgroundColor: Colors.black,
          actions: [
            TextButton.icon(
              onPressed: () {
                ref.read(jobViewModelProvider.notifier).resetState();
              },
              icon: const Icon(
                Icons.refresh,
                color: Colors.white,
              ),
              label: const Text(
                'Refresh',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            ref.read(jobViewModelProvider.notifier).resetState();
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: state.jobApiModel.length,
                    itemBuilder: (context, index) {
                      final jobs = state.jobApiModel[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16.0),
                        child: Card(
                          elevation: 4.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                // leading: Text(jobs.id.toString()),
                                title: Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    jobs.title,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ),
                                subtitle: Text(jobs.description.length > 100
                                    ? '${jobs.description.substring(0, 150)}...'
                                    : jobs.description),
                                trailing: Text(jobs.salary),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                              ),
                              SizedBox(
                                  height:
                                      10), // Add some space between subtitle and button
                              Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(backgroundColor: Color(kOrange.value)),
                                      onPressed: () {},
                                      child: Text(
                                        'View  Details',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      )),
                                ),
                                // child: TextButton(
                                //   onPressed: () {
                                //     // Add your code here for handling the "View Details" button press
                                //   },
                                //   child: Text(
                                //     'View Details',
                                //     style: TextStyle(color: Colors.blue),
                                //   ),
                                // ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                if (state.isLoading)
                  const CircularProgressIndicator(color: Colors.red),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
