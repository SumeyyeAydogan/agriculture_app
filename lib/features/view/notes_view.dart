import 'package:agriculture_app/core/extension/context_extension.dart';
import 'package:agriculture_app/features/cubit/note/note_cubit.dart';
import 'package:agriculture_app/features/cubit/note/note_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../product/widget/note_item.dart';
import '../model/note/note_model.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final ScrollController _scrollController = ScrollController();
  int _currentMax = 10;
  List<String> dummyList = List.generate(10, (index) => "Item: ${index + 1}");

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent == _scrollController.offset) {
        dummyList = List.generate(_currentMax, (index) => "Item: ${index + 1}");
        _getMoreList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => NoteCubit(NoteInitialState()),
        child: BlocBuilder<NoteCubit, NoteState>(
          builder: (context, state){
            return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            controller: _scrollController,
            itemBuilder: (context, index) {
              if (index == dummyList.length) {
                return const CupertinoActivityIndicator();
              }
              return Padding(
                padding: context.paddingMediumHorizontal,
                child: NoteItem(
                    note: Note.create(title: "title", content: "content"),
                    noteContentController: TextEditingController()),
              );
            },
            itemCount: dummyList.length + 1,
            shrinkWrap: true,
          );
        }));
  }

  void _getMoreList() {
    debugPrint("Get more list");
    for (var i = _currentMax; i < _currentMax + 10; i++) {
      dummyList.add("Item: ${i + 1}");
    }
    _currentMax = _currentMax + 10;
    setState(() {});
  }
}
