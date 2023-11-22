import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/models/note_model.dart';

import '../../constants.dart';
part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  late bool isDark = true;
  List<NoteModel>? notes;
  fetchAllNotes() async {
    var noteBox = Hive.box<NoteModel>(kNotesBox);
    notes = noteBox.values.toList();
    isDark = await Hive.openBox<bool>(kThemeBox).then((value) {
      return value.get(kThemeKey, defaultValue: false)?? false;
    });
    emit((NotesSuccessLoadedState()));
  }

  void changeThem(bool value) {
    var themeBox = Hive.box<bool>(kThemeBox);
    themeBox.put(kThemeKey, value);
    isDark = value;
    emit(NotesChangeThemeState());
  }
}
