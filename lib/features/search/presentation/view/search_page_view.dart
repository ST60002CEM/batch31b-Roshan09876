import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:job_finder/config/constant/app_constants.dart';
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
                onChanged: (value){
                  ref.read(searchViewModelProvider.notifier).getSeacrhJobs(value);
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
            ],
          ),
        ),
      ),
    );
  }
}
