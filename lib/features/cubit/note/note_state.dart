import 'package:equatable/equatable.dart';

import '../../model/note/note_model.dart';

abstract class NoteState extends Equatable {}

class NoteInitialState extends NoteState {
  @override
  List<Object?> get props => [];
}

class AddingNoteLoadingState extends NoteState {
  AddingNoteLoadingState();
  @override
  List<Object?> get props => [];
}
class AddingNoteCompletedState extends NoteState {
  AddingNoteCompletedState(this.newAddedNote);
  final Note newAddedNote;
  @override
  List<Object?> get props => [newAddedNote];
}

/* class EditingNoteState extends NoteState {
  EditingNoteState(this.newTitle, this.newContent);
  final String newTitle;
  final String newContent;
  @override
  List<Object?> get props => [newTitle, newContent];
}

class DeleteNoteState extends NoteState {
  final String index;
  @override
  List<Object?> get props => [index];
  DeleteNoteState(this.index);
} */

class GetBoxState extends NoteState {
  @override
  List<Object?> get props => [];
}

class GetAllNotesState extends NoteState {
  GetAllNotesState(this.allNotes);
  final List<Note>? allNotes;
  @override
  List<Object?> get props => [allNotes];
}
