import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Text(index.toString() + "done page");
      },
      itemCount: 20,
      shrinkWrap: true,
    );
  }
}
