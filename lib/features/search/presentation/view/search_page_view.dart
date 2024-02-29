import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:job_finder/config/constant/app_constants.dart';
import 'package:job_finder/config/constant/reusable_text.dart';
import 'package:job_finder/features/search/presentation/view_model/search_view_model.dart';

class SearchPageView extends ConsumerStatefulWidget {
  const SearchPageView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchPageViewState();
}

class _SearchPageViewState extends ConsumerState<SearchPageView> {
  @override
  Widget build(BuildContext context) {
    FocusNode _focusNode = FocusNode();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(searchViewModelProvider.notifier).getSeacrhJobs("");
    });
    return Scaffold(
      appBar: AppBar(
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
                focusNode: _focusNode,
                onChanged: (value) {
                  ref
                      .read(searchViewModelProvider.notifier)
                      .getSeacrhJobs(value);
                },
                decoration: InputDecoration(
                  hintText: 'Search',
                  suffixIcon: Icon(
                    Icons.search,
                    color: Color(kOrange.value),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              Expanded(
                child: Consumer(
                  builder: (context, watch, child) {
                    final state = ref.read(searchViewModelProvider);
                    if (state.isLoading && state.page == 0) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: state.searchApiModel.length,
                        // itemCount: 1,
                        itemBuilder: (context, index) {
                          final job = state.searchApiModel[index];
                          return ListTile(
                            title: Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: ReusableText(
                                    text: job.title,
                                    fontSize: 25,
                                    color: Color(kDark.value))),
                            subtitle: Text(job.description.length > 100
                                ? '${job.description.substring(0, 150)}...'
                                : job.description),
                            trailing: ReusableText(
                                text: job.salary,
                                fontSize: 15,
                                color: Color(kOrange.value)),
                          );
                        },
                      );
                    }
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
