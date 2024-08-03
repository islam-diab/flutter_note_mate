import 'package:flutter/material.dart';
import 'package:flutter_note_mate/core/theming/app_color.dart';
import 'package:flutter_note_mate/features/note_veiw/view/add_note/add_note_view.dart';
import 'package:flutter_note_mate/features/note_veiw/view/note_view/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColor.primaryColor,
      drawer: Drawer(),
      resizeToAvoidBottomInset: false,
      floatingActionButton: AddNoteView(),
      body: NotesViewBody(),
    );
  }
}
