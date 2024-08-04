import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_note_mate/core/helpre/assests.dart';
import 'package:flutter_note_mate/core/helpre/extensions.dart';
import 'package:flutter_note_mate/core/theming/app_color.dart';
import 'package:flutter_note_mate/core/widget/auth/text_form_field.dart';
import 'package:flutter_note_mate/features/note_veiw/logic/notes_cubit.dart';
import 'package:flutter_note_mate/features/note_veiw/view/note_view/custom_app_bar.dart';
import 'package:flutter_note_mate/features/note_veiw/view/note_view/note_empty.dart';
import 'package:flutter_note_mate/features/note_veiw/view/note_view/notes_item.dart';

part 'widget/note_search_builder.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
          child: Column(
            children: [
              CustomAppBar(
                  title: 'Search Note',
                  perfixIcon: Icons.arrow_back,
                  onPressedInPerfixIcon: () {
                    context.read<NotesCubit>().searchController.clear();
                    context.read<NotesCubit>().results.clear();
                    context.pop();
                  }),
              AppTextFormField(
                controller: context.read<NotesCubit>().searchController,
                hintText: 'Search Note',
                onChanged: (query) {
                  context.read<NotesCubit>().searchNotesByTitle(query);
                },
                textInputAction: TextInputAction.done,
              ),
              const NoteSearchBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
