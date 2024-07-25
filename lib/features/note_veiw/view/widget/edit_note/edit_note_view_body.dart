import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_note_mate/core/helpre/extensions.dart';
import 'package:flutter_note_mate/core/helpre/spase.dart';
import 'package:flutter_note_mate/core/theming/text_styles.dart';
import 'package:flutter_note_mate/core/widget/auth/text_form_field.dart';
import 'package:flutter_note_mate/features/note_veiw/logic/notes_cubit.dart';
import 'package:flutter_note_mate/features/note_veiw/data/models/note_model.dart';
import 'package:flutter_note_mate/features/note_veiw/view/widget/note_view/custom_app_bar.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    context.read<NotesCubit>().titleController.text = note.title;
    context.read<NotesCubit>().contentController.text = note.content;
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
              onPressedInPerfixIcon: () {
                context.pop();
              },
              perfixIcon: Icons.arrow_back,
              title: 'Edit Note',
              suffixIcon: Icons.check,
              onPressedInSuffixIcon: () {
                context.read<NotesCubit>().editNote(note);
                Navigator.pop(context);
              },
            ),
            verticalSpace(50),
            AppTextFormField(
              
              controller: context.read<NotesCubit>().titleController,
              textInputAction: TextInputAction.newline,
            ),
            verticalSpace(20),
            TextField(
              controller: context.read<NotesCubit>().contentController,
              style: AppTextStyles.font35RegularWhite,
              textInputAction: TextInputAction.newline,
              maxLines: 25,
              decoration: const InputDecoration(),
            ),
            verticalSpace(50),
          ],
        ),
      ),
    );
  }
}
