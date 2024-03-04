import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:job_finder/config/constant/app_constants.dart';
import 'package:job_finder/config/constant/reusable_text.dart';
import 'package:job_finder/features/search/presentation/view/search_show.dart';
import 'package:job_finder/features/search/presentation/view_model/search_view_model.dart';

class SearchPageView extends ConsumerStatefulWidget {
  const SearchPageView({Key? key}) : super(key: key);

  @override
  _SearchPageViewState createState() => _SearchPageViewState();
}

class _SearchPageViewState extends ConsumerState<SearchPageView> {
  TextEditingController serachController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(searchViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(kDark.value),
        title: Text('Search'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              TextField(
                controller: serachController,
                onSubmitted: (value) {
                  // Trigger search when Enter key is pressed
                    ref
                        .read(searchViewModelProvider.notifier)
                        .getSearchJobs(value);

                },
                decoration: InputDecoration(
                  hintText: 'Search',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      ref
                          .read(searchViewModelProvider.notifier)
                          .getSearchJobs(serachController.text);
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              Expanded(
                child: state.isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : state.searchApiModel.isEmpty
                        ? Center(
                            child: Text('No results found.'),
                          )
                        : ListView.builder(
                            itemCount: state.searchApiModel.length,
                            itemBuilder: (context, index) {
                              final job = state.searchApiModel[index];
                              return ListTile(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          SearchShowScreen(jobs: job),
                                    ),
                                  );
                                },
                                title: Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: ReusableText(
                                    text: job.title,
                                    fontSize: 25,
                                    color: Color(kDark.value),
                                  ),
                                ),
                                subtitle: Text(
                                  job.description.length > 100
                                      ? '${job.description.substring(0, 150)}...'
                                      : job.description,
                                ),
                                trailing: ReusableText(
                                  text: job.salary,
                                  fontSize: 15,
                                  color: Color(kOrange.value),
                                ),
                              );
                            },
                          ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
