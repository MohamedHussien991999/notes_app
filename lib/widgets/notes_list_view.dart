import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubit/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/notes_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key, required this.notes});
  final List<NoteModel> notes ;
  @override

  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
         BlocProvider.of<NotesCubit>(context).fetchAllNotes();
        List<NoteModel> notes =
            BlocProvider.of<NotesCubit>(context).notes ?? [];
        return Padding(
          padding: const EdgeInsets.only(top: 16),
          child: ListView.builder(
            itemCount: notes.length,
            physics: const BouncingScrollPhysics(
              parent: BouncingScrollPhysics(),
            ),
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return Dismissible(
                key: ValueKey<int>(notes[index].hashCode),
                background: Container(
                  color: Colors.green,
                  child: const Center(
                      child: Icon(
                    Icons.delete,
                    size: 60,
                  )),
                ),
                confirmDismiss: (dismissDirection) async {
                  if (dismissDirection == DismissDirection.startToEnd) {
                    return showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Delete Item'),
                          content: const Text(
                              'Are you sure you want to delete this item?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                     notes[index].delete();
                                  BlocProvider.of<NotesCubit>(context)
                                      .fetchAllNotes();
                                Navigator.of(context).pop(
                                    true); // Indicate deletion confirmation
                              },
                              child: const Text('Delete'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pop(false); // Indicate cancellation
                              },
                              child: const Text('Cancel'),
                            ),
                          ],
                        );
                      },
                    );
                  } else if (dismissDirection == DismissDirection.endToStart) {
                    // Show delete confirmation dialog
                    return showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Delete Item'),
                          content: const Text(
                              'Are you sure you want to delete this item?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                notes[index].delete();
                                  BlocProvider.of<NotesCubit>(context)
                                      .fetchAllNotes();
                                Navigator.of(context).pop(
                                    true); // Indicate deletion confirmation
                              },
                              child: const Text('Delete'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pop(false); // Indicate cancellation
                              },
                              child: const Text('Cancel'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                  return null;
                },
                child: NotesItem(
                  note: notes[index],
                  index: index,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
