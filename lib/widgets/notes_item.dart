import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_note_view.dart';

class NotesItem extends StatelessWidget {
  const NotesItem({super.key, required this.note, required this.index});
  final NoteModel note;
  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return EditNoteView(note: note);
          }),
        );
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 24, bottom: 24, left: 16),
            decoration: BoxDecoration(
              color: Color(note.color),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: Text(
                      note.title,
                      style: const TextStyle(fontSize: 25, color: Colors.black),
                    ),
                  ),
                  subtitle: Text(
                    note.subTitle,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                  trailing: const Padding(
                    padding: EdgeInsets.only(right: 30.0),
                    child: Icon(
                      FontAwesomeIcons.penToSquare,
                      size: 40,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 24),
                  child: Text(
                    note.date,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
