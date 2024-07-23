import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_note_mate/core/helpre/app_constant.dart';
import 'package:flutter_note_mate/features/note_veiw/models/note_model.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  Color color = const Color(0xffFD99FF);
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  List<NoteModel>? notes;

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
      fetchAllNotes();
      emit(AddNoteSuccess());
    } catch (e) {
      emit(NotesError(error: e.toString()));
    }
  }
}
