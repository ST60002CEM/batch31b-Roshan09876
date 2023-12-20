import 'package:flutter/material.dart';
import 'package:job_finder/config/constant/app_constants.dart';

class ChatListPage extends StatelessWidget {
  const ChatListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(backgroundColor: Color(kDark.value), title: Text('Chat List')),
      body: Center(
        child: Text('Chat List'),
      ),
    );
  }
}
