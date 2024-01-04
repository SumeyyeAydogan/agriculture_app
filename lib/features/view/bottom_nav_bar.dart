import 'package:agriculture_app/core/extension/context_extension.dart';
import 'package:agriculture_app/core/init/theme/agriculture_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  String currentPage = "Home Page";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TabCubit(TabController(length: 4, vsync: this)),
      child: BlocBuilder<TabCubit, TabState>(
        builder: (context, state) {
          if (state is TabInitial) {
            return Scaffold(
                appBar: AppBar(
                  title: Text(currentPage, style: context.theme.textTheme.headlineMedium,),
                  centerTitle: false,
                ),
                bottomNavigationBar: BottomNavigationBar(
                    selectedItemColor: Colors.black,
                    unselectedItemColor: Colors.grey,
                    currentIndex: state.tabController!.index,
                    onTap: (index) {
                      context.read<TabCubit>().changeIndex(index: index);
                      currentPage = screenNameList[state.tabController!.index];
                    },
                    items: const [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home_outlined), label: "Home",
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.done_outlined), label: "To Do",
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
                ? FloatingActionButton(onPressed: (){}, backgroundColor: context.theme.colorScheme.error, child: Icon(Icons.edit),)
                : null,
                );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
