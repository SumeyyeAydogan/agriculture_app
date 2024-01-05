import 'package:agriculture_app/core/constants/note_constants.dart';
import 'package:agriculture_app/core/extension/context_extension.dart';
import 'package:agriculture_app/core/init/theme/agriculture_theme.dart';
import 'package:agriculture_app/features/cubit/note/note_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/constants/application_constants.dart';
import '../../core/constants/auth_constants.dart';
import '../cubit/note/note_cubit.dart';
import '../cubit/tab/tab_cubit.dart';
import 'chat_view.dart';
import 'home_view.dart';
import 'notes_view.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

@override
void initState() {}

class _BottomNavBarState extends State<BottomNavBar> with TickerProviderStateMixin {
  List<Widget?> screenList = [
    const HomePage(),
    const HomePage(),
    //const AllToDosPage(),
    const ChatPage(),
    const NotesPage(),
  ];
  List<String> screenNameList = [
    "Home Page",
    "To Do Page",
    "Chat Page",
    "Notes Page",
  ];
  String _currentPage = "Home Page";
  get currentPage => _currentPage;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TabCubit(TabController(length: 4, vsync: this)),
      child: BlocBuilder<TabCubit, TabState>(
        builder: (context, state) {
          if (state is TabInitial) {
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  _currentPage,
                  style: context.theme.textTheme.headlineMedium,
                ),
                centerTitle: false,
              ),
              bottomNavigationBar: BottomNavigationBar(
                  selectedItemColor: Colors.black,
                  unselectedItemColor: Colors.grey,
                  currentIndex: state.tabController!.index,
                  onTap: (index) {
                    context.read<TabCubit>().changeIndex(index: index);
                    _currentPage = screenNameList[state.tabController!.index];
                  },
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home_outlined),
                      label: "Home",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.done_outlined),
                      label: "To Do",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.chat_outlined,
                      ),
                      label: "Chat",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.note_outlined),
                      label: "Notes",
                    ),
                  ]),
              body: screenList[state.tabController!.index],
              floatingActionButton: state.tabController!.index == 3
                  ? FloatingActionButton(
                      onPressed: () {
                        _showAddNoteBottomSheet(context);
                      },
                      backgroundColor: context.theme.colorScheme.error,
                      child: const Icon(Icons.add),
                    )
                  : null,
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  _showAddNoteBottomSheet(BuildContext context) {
    String noteTitle = "Yeni Metin";
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Container(
            padding: context.paddingTopKeyboard, //klavyenin üstüne koyar
            width: context.width,
            child: BlocConsumer<NoteCubit, NoteState>(
              listener: (context, state) {
                if (state is AddingNoteCompletedState) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Not eklendi"),
                    backgroundColor: Colors.greenAccent,
                  ));
                }
              },
              builder: (context, state) {
                return Column(
                  mainAxisSize: MainAxisSize.min, //içerik arttıkça bottomSheet boyutunu artırıyor
                  children: [
                    ListTile(
                      title: TextField(
                        autofocus: true,
                        style: const TextStyle(fontSize: 20),
                        decoration: const InputDecoration(
                          hintText: NoteConstants.NOTE_TITLE,
                          hintMaxLines: 1,
                        ),
                        onChanged: (value) {
                          noteTitle = value.isNotEmpty ? value : "Yeni Metin";
                        },
                      ),
                    ),
                    ListTile(
                      title: TextField(
                        autofocus: true,
                        style: const TextStyle(fontSize: 20),
                        decoration: const InputDecoration(
                          hintText: NoteConstants.TYPE_NOTE,
                          border: InputBorder.none, //alttaki çizgiyi kaldırdı
                        ),
                        minLines: 1,
                        maxLines: null,
                        textInputAction: TextInputAction.done, //klavyede tik işareti olmasını sağlar.
                        keyboardType: TextInputType.multiline,
                        onSubmitted: (value) async {
                          var noteContent = value;
                          Navigator.of(context).pop();
                          await context.read<NoteCubit>().addNote(noteTitle, noteContent);
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        });
  }
}
