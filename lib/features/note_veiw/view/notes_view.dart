// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_note_mate/core/theming/app_color.dart';
import 'package:flutter_note_mate/features/note_veiw/view/add_note/add_note_view.dart';
import 'package:flutter_note_mate/features/note_veiw/view/note_view/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key, required this.onPressedInPerfixIcon});
  final void Function() onPressedInPerfixIcon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      drawer: const Drawer(),
      resizeToAvoidBottomInset: false,
      floatingActionButton: const AddNoteView(),
      body: NotesViewBody(
        onPressedInPerfixIcon: onPressedInPerfixIcon,
      ),
    );
  }
}
