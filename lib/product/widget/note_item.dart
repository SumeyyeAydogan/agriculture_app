import 'package:agriculture_app/core/extension/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/cubit/note/note_cubit.dart';
import '../../features/cubit/note/note_state.dart';
import '../../features/model/note/note_model.dart';

class NoteItem extends StatelessWidget {
  final Note note;
  final TextEditingController noteContentController;
  const NoteItem({Key? key, required this.note, required this.noteContentController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteCubit, NoteState>(
      builder: (context, state) {
        Future.microtask(() {
          noteContentController.text = note.content;
        }); //Futuremicrotask
        return Container(
          margin: context.paddingMediumLowVertical,
          padding: context.paddingMediumHorizontal,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.2),
                blurRadius: 10, //dağıtmaya yarıyor.
              ),
            ],
          ),
          child: TextField(
            controller: noteContentController,
            minLines: 1,
            maxLines: null,
            textInputAction: TextInputAction.done, //klavyede tik işareti olmasını sağlar.
            decoration: const InputDecoration(border: InputBorder.none),
            onSubmitted: (newValue) async {
              if (newValue.length > 3) {
                context.read<NoteCubit>().editNote(note.title, newValue, note);
                if (state is EditingNoteState) {
                  note.content = state.newContent;
                } else {
                  const SnackBar(content: Text("An error"));
                }
              }
            },
          ),
        );
      },
    );
  }
}
