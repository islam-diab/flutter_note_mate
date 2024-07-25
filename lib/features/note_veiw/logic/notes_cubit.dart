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
  final GlobalKey<FormState> formKey = GlobalKey();

  List<NoteModel>? notes;

  final NoteRepo noteRepo;

  fetchAllNotes() {
    var noteBox = Hive.box<NoteModel>(HiveConstant.noteBox);

    notes = noteBox.values.toList();
    emit(NotesSucces());
  }

  addNote() async {
    emit(NotesLoading());
    try {
      DateTime currentDate = DateTime.now();
      String formatCurrentDate = DateFormat.yMd().format(currentDate);
      var note = NoteModel(
        title: titleController.text,
        content: contentController.text,
        date: formatCurrentDate,
        color: Colors.tealAccent.value,
      );
      note.color = color.value;
      var noteBox = Hive.box<NoteModel>(HiveConstant.noteBox);
      await noteBox.add(note);
      var appUser = Hive.box<AppUser>(HiveConstant.userBox);
      AppUser user = appUser.get(HiveConstant.currentUser)!;
      noteRepo.addNote(
        documentId: user.uid + currentDate.toString(),
        title: titleController.text,
        content: contentController.text,
        data: formatCurrentDate,
        color: color.value,
      );
      titleController.clear();
      contentController.clear();

      emit(AddNoteSuccess());
    } catch (e) {
      emit(NotesError(error: e.toString()));
    }
  }

  editNote(NoteModel note) async {
    emit(NotesLoading());
    try {
      note.title = titleController.text;
      note.content = contentController.text;
      note.save();
      emit(AddNoteSuccess());
    } catch (e) {
      emit(NotesError(error: e.toString()));
    }
  }
}
