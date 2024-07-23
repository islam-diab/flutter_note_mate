part of 'notes_cubit.dart';

@immutable
abstract class NotesState {}

class NotesInitial extends NotesState {}

class NotesLoading extends NotesState {}

class AddNoteSuccess extends NotesState {}

class NotesSucces extends NotesState {}

class NotesError extends NotesState {
  final String error;
  NotesError({required this.error});
}
