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

// Search Notes
class SearchNotesSucces extends NotesState {
  final List<NoteModel> results;
  SearchNotesSucces({required this.results});
}

class SearchNotesEmpty extends NotesState {}

class SearchNotesFailure extends NotesState {}
