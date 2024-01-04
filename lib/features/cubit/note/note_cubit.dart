import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../product/widget/custom_search_delegate.dart';
import '../../model/note/note_model.dart';
import 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit(super.initialState);
  //final LocalStorage _localStorage = locator<LocalStorage>();

  late List<Note>? allNotes = <Note>[];
  DateTime initialDate = DateTime.now();
  List<int>? keys = [];

  addNote(String title, String content) async {
    var newAddedNote = Note.create(title: title, content: content);
    allNotes!.insert(0, newAddedNote);
    //await _localStorage.addTask(task: newAddedTask);
    emit(AddedNoteState(newAddedNote));
  }

  editNote(String newTitle, String newContent, Note note) {
    note.title = newTitle;
    note.content = newContent;
    //_localStorage.updateTask(task: task);
    emit(EditingNoteState(newTitle, newContent));
  }


  deleteTask(Note note, int currentListIndex) async {
    allNotes!.removeAt(currentListIndex);
    //await _localStorage.deleteTask(task: task);
    emit(DeleteNoteState(note.id));
  }

  void getAllTaskFromDb() async {
    //allTasks = await _localStorage.getAllTask();
  }

  void showSearchDelegate(BuildContext context) {
    showSearch(context: context, delegate: CustomSearchDelegate());
  }
}
