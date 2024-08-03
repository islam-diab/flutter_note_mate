
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_note_mate/core/helpre/app_constant.dart';
import 'package:flutter_note_mate/core/model/app_user.dart';
import 'package:flutter_note_mate/features/note_veiw/data/models/note_model.dart';
import 'package:flutter_note_mate/features/note_veiw/data/repo/note_repo.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit(this.noteRepo) : super(NotesInitial());

  Color color = const Color(0xffFD99FF);
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  final TextEditingController searchController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  List<NoteModel>? notes;
  final List<NoteModel> results = [];

  final NoteRepo noteRepo;

  fetchAllNotes() {
    var noteBox = Hive.box<NoteModel>(HiveConstant.noteBox);

    notes = noteBox.values.toList();
    emit(NotesSucces());
  }

  void addNote() async {
    emit(NotesLoading());
    try {
      DateTime currentDate = DateTime.now();
      String formatCurrentDate = DateFormat.yMd().format(currentDate);
      var appUser = Hive.box<AppUser>(HiveConstant.userBox);
      AppUser user = appUser.get(HiveConstant.currentUser)!;
      String noteId = user.uid + currentDate.toString();

      var note = NoteModel(
        title: titleController.text,
        content: contentController.text,
        date: formatCurrentDate,
        color: Colors.tealAccent.value,
        noteId: noteId,
      );

      note.color = color.value;
      var noteBox = Hive.box<NoteModel>(HiveConstant.noteBox);
      await noteBox.add(note);

      noteRepo.addNote(
        documentId: noteId,
        title: titleController.text,
        content: contentController.text,
        data: formatCurrentDate,
        color: color.value,
        noteId: noteId,
      );
      titleController.clear();
      contentController.clear();

      emit(AddNoteSuccess());
    } catch (e) {
      emit(NotesError(error: e.toString()));
    }
  }

  void editNote(NoteModel note) async {
    emit(NotesLoading());
    try {
      note.title = titleController.text;
      note.content = contentController.text;
      noteRepo.updateNote(note: note, documentId: note.noteId);
      note.save();
      emit(AddNoteSuccess());
    } catch (e) {
      emit(NotesError(error: e.toString()));
    }
  }

  void deleteNote(NoteModel note) async {
    emit(NotesLoading());
    try {
      note.delete();
      noteRepo.deleteNotsInFirestore(documentId: note.noteId);
      fetchAllNotes();
      emit(AddNoteSuccess());
    } catch (e) {
      emit(NotesError(error: e.toString()));
    }
  }

  void searchNotesByTitle(String query) async {
    List<NoteModel> hiveNotes = [];
    results.clear();
    // Search in Hive
    if (searchController.text.isEmpty) {
      emit(SearchNotesEmpty());
    } else {
      var noteBox = await Hive.openBox<NoteModel>(HiveConstant.noteBox);
      hiveNotes = noteBox.values
          .where(
              (note) => note.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
      results.addAll(hiveNotes);

      if (results.isEmpty) {
        emit(SearchNotesFailure());
      } else {
        emit(SearchNotesSucces(results: results));
      }
    }
  }
}
