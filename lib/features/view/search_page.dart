import 'package:flutter/material.dart';
import 'package:job_finder/config/constant/app_constants.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {

    FocusNode _focusNode = FocusNode();
  

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
    );}
}
