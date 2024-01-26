import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
        appBar: AppBar(
          title: Text('Jobs'),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            ref.read(jobViewModelProvider.notifier).resetState();
          },
          child: Column(
            children: [
              Expanded(
                  child: ListView.builder(
                      itemCount: state.jobApiModel.length,
                      itemBuilder: (context, index) {
                        final jobs = state.jobApiModel[index];
                        return ListTile(
                          leading: Text(jobs.id.toString()),
                          title: Text(jobs.title),
                          subtitle: Text(jobs.description),
                        );
                      })),
              if (state.isLoading)
                const CircularProgressIndicator(color: Colors.red),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
