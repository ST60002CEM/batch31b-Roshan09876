import 'package:flutter/material.dart';
import 'package:job_finder/features/bookmarks/presentation/view/bookmarks_page.dart';
import 'package:job_finder/features/view/chat/chat_list.dart';
import 'package:job_finder/features/auth/presentation/view/profile_page_view.dart';
import 'package:job_finder/features/home/main_screen_view.dart';

class HomeState {
  final List<Widget> lstWidget;
  final int index;

  HomeState({
    required this.lstWidget,
    required this.index,
  });

  //Making another construtor to contact with StateNotifier
  factory HomeState.intitial() {
    return HomeState(lstWidget: [
      MainScreenView(),
      BookMarksPage(),
      ChatListPage(),
      // ChatView(),
      ProfilePageView(),
    ], index: 0);
  }

  //Making copy with function to change the index number
  HomeState copywith({
    int? index,
  }) {
    return HomeState(lstWidget: lstWidget, index: index ?? this.index);
  }
}
