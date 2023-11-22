import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_app_bar_edit.dart';
import 'package:notes_app/widgets/custom_color_view.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

import '../cubit/notes_cubit/notes_cubit.dart';

class NotesEditViewBody extends StatefulWidget {
  const NotesEditViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<NotesEditViewBody> createState() => _NotesEditViewBodyState();
}

class _NotesEditViewBodyState extends State<NotesEditViewBody> {
  String? title, content;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 24,
          horizontal: 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              CustomAppBarEdit(
                  title: 'Edit Note',
                  icon: Icons.check,
                  onPressed: () {
                    widget.note.title = title ?? widget.note.title;
                    widget.note.subTitle = content ?? widget.note.subTitle;
                    widget.note.save();
                    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Note Edited Successfully'),
                      ),
                    );
                    Navigator.pop(context);
                  }),
              const SizedBox(
                height: 30,
              ),
              CustomTextField(
                hint: widget.note.title,
                maxLines: 1,
                onChanged: (value) {
                  title = value;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              CustomTextField(
                hint: widget.note.subTitle,
                maxLines: 5,
                onChanged: (value) {
                  content = value;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              EditNoteColorList(note: widget.note),
            ],
          ),
        ),
      ),
    );
  }
}
