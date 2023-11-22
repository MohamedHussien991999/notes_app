part of 'notes_cubit.dart';

abstract class NotesState {}

class NotesInitial extends NotesState {}

class NotesLoadingState extends NotesState {}

class NotesSuccessLoadedState extends NotesState {}

class NotesChangeThemeState extends NotesState {}
