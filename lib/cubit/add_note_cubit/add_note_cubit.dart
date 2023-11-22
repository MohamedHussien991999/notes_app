import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/models/note_model.dart';

import '../../constants.dart';
part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitialState());
  Color selectedColor = const Color(0xff96BBBB);
  addNote(NoteModel note) {
    note.color = selectedColor.value;
    emit(AddNoteLoadingState());
    try {
      var noteBox = Hive.box<NoteModel>(kNotesBox);
      noteBox.add(note);
      emit(AddNoteSuccessState());
    } catch (e) {
      emit(AddNoteErrorState(e.toString()));
      log(e.toString());
    }
  }
}
