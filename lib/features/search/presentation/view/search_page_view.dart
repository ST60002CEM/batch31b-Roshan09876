import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:job_finder/config/constant/app_constants.dart';
import 'package:job_finder/config/constant/reusable_text.dart';
import 'package:job_finder/config/router/app_routes.dart';
import 'package:job_finder/features/pagination/presentation/view/jobs_view_detail.dart';
import 'package:job_finder/features/search/presentation/view/search_show.dart';
import 'package:job_finder/features/search/presentation/view_model/search_view_model.dart';

class SearchPageView extends ConsumerStatefulWidget {
  const SearchPageView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchPageViewState();
}

class _SearchPageViewState extends ConsumerState<SearchPageView> {

  TextEditingController serachController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final state = ref.read(searchViewModelProvider);
    FocusNode _focusNode = FocusNode();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // ref.read(searchViewModelProvider.notifier).getSeacrhJobs("");
    });
    return Scaffold(
      appBar: AppBar( backgroundColor: Color(kDark.value),
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
                focusNode: _focusNode,
              
                // onChanged: (value) {
                //   ref
                //       .read(searchViewModelProvider.notifier)
                //       .getSeacrhJobs(value);
                // },
                decoration: InputDecoration(
                  hintText: 'Search',
                  suffixIcon: InkWell(
                    onTap: (){
                      print("CONTROLLER:::${serachController.text}");
                      ref
                      .read(searchViewModelProvider.notifier)
                      .getSeacrhJobs(serachController.text);
                    },
                    child: Icon(
                      Icons.search,
                      color: Color(kOrange.value),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              Expanded(
                child: Consumer(
                  builder: (context, watch, child) {
                    print("Build Lenght  ${state.searchApiModel.length}");
                    if (state.isLoading) {
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
                            onTap: () {
                              // Navigator.pushNamed(
                              //     context, AppRoute.searchShowScreen,
                              //     arguments: state.searchApiModel[index]);
                              print(state.searchApiModel[index]);

                              Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchShowScreen(jobs: state.searchApiModel[index])));
                            },
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
