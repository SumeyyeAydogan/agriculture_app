import 'package:flutter/material.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
/* 
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  ScrollController _scrollController = ScrollController();
  int _currentMax = 10;
  List<String> dummyList = List.generate(10, (index) => "Item: ${index + 1}");

  @override
  void initState() {
    _scrollController.addListener(() {
      if ( _scrollController.position.maxScrollExtent == _scrollController.offset) {
        dummyList = List.generate(_currentMax, (index) => "Item: ${index + 1}");
        _getMoreList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      controller: _scrollController,
      itemBuilder: (context, index) {
        if (index == dummyList.length) {
          return CupertinoActivityIndicator();
        }
        return Container(
          child: Text("Notes"),
          //NoteItem(note: Note.cre, noteContentController: noteContentController),
        );
      },
      itemCount: dummyList.length + 1,
      shrinkWrap: true,
    );
  }

  void _getMoreList() {
    debugPrint("Get more list");
    for (var i = _currentMax; i < _currentMax + 10; i++) {
      dummyList.add("Item: ${i + 1}");
    }
    _currentMax = _currentMax + 10;
    setState(() {});
  }
} */