part of 'add_note_cubit.dart';

abstract class AddNoteState   {
}
class AddNoteInitialState extends AddNoteState{}

class AddNoteLoadingState extends AddNoteState{}

class AddNoteSuccessState extends AddNoteState{}

class AddNoteErrorState extends AddNoteState{
  final String error;
  AddNoteErrorState(this.error);
}
