import 'package:flutter/material.dart';
import 'package:flutter_note_mate/core/theming/app_color.dart';
import 'package:flutter_note_mate/features/note_veiw/models/note_model.dart';
import 'package:flutter_note_mate/features/note_veiw/view/widget/edit_note/edit_note_view_body.dart';

class EditeNoteView extends StatelessWidget {
  const EditeNoteView({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: EditNoteViewBody(
        note: note,
      ),
    );
  }
}
