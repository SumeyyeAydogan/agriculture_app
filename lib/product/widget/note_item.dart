import 'package:agriculture_app/core/extension/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/cubit/note/note_cubit.dart';
import '../../features/cubit/note/note_state.dart';
import '../../features/model/note/note_model.dart';

class NoteItem extends StatelessWidget {
  final Note note;
  final TextEditingController noteContentController;
  final TextEditingController noteTitleController;

  const NoteItem({Key? key, required this.note, required this.noteContentController, required this.noteTitleController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteCubit, NoteState>(
      builder: (context, state) {
        Future.microtask(() {
          noteContentController.text = note.content;
          noteTitleController.text = note.title;
        }); //Futuremicrotask
        return Column(
          children: [
            SizedBox(height: context.mediumValue,),
            Expanded(
              flex: 80,
              child: Container(
                //height: context.extraHighValue,
                //margin: context.paddingMediumVertical,
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
                  textInputAction: TextInputAction.done, //klavyede ok işareti olmasını sağlar.
                  decoration: const InputDecoration(border: InputBorder.none),
                  onSubmitted: (newValue) async {
                    if (newValue.length > 3) {
                      context.read<NoteCubit>().editNoteContent(newValue, note);
                    }
                  },
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.top,
                title: TextField(
                    controller: noteTitleController,
                    maxLines: 1,
                    style: context.theme.textTheme.titleSmall,
                    textInputAction: TextInputAction.done, //klavyede tik işareti olmasını sağlar.
                    decoration: const InputDecoration(border: InputBorder.none),
                    onSubmitted: (newValue) async {
                      newValue.isNotEmpty
                      ? context.read<NoteCubit>().editNoteTitle(newValue, note)
                      : context.read<NoteCubit>().editNoteTitle(note.title, note);
                    },
                  ),
              ),
            ),
            SizedBox(height: context.mediumValue,)
          ],
        );
      },
    );
  }
}
