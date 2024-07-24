import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_note_mate/core/helpre/spase.dart';
import 'package:flutter_note_mate/core/widget/auth/app_text_bottom.dart';
import 'package:flutter_note_mate/core/widget/auth/text_form_field.dart';
import 'package:flutter_note_mate/features/note_veiw/cubit/notes_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'color_list_view.dart';

class AddNoteForm extends StatelessWidget {
  const AddNoteForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<NotesCubit>().formKey,
      child: Column(
        children: [
          SizedBox(
            height: 22.h,
            child: Center(
              child: Container(
                height: 7.h,
                width: 100.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),
          ),
          verticalSpace(16),
          AppTextFormField(
            controller: context.read<NotesCubit>().titleController,
            hintText: 'Title',
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Title must not be empty';
              }
              return '';
            },
            maxLine: 1,
            textInputAction: TextInputAction.next,
          ),
          verticalSpace(18),
          AppTextFormField(
            controller: context.read<NotesCubit>().contentController,
            hintText: 'Content',
            validator: (value) {
              return '';
            },
            maxLine: 7,
            textInputAction: TextInputAction.newline,
          ),
          verticalSpace(18),
          const ColorsListView(),
          verticalSpace(18),
          BlocBuilder<NotesCubit, NotesState>(
            builder: (context, state) {
              return AppTextBottom(
                isLoading: state is NotesLoading ? true : false,
                onTap: () {
                  if (context
                      .read<NotesCubit>()
                      .formKey
                      .currentState!
                      .validate()) {
                    context.read<NotesCubit>().addNote();
                  }
                },
                text: 'Add Note',
              );
            },
          ),
          verticalSpace(18),
        ],
      ),
    );
  }
}
