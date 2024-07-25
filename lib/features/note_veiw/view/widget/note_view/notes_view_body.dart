import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/notes_cubit.dart';
import 'custom_app_bar.dart';
import 'notes_list_view.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
      child: Column(
        children: [
          CustomAppBar(
            title: 'Notes',
            perfixIcon: Icons.menu,
            onPressedInPerfixIcon: () {},
            suffixIcon: Icons.search,
            onPressedInSuffixIcon: () {},
          ),
          const Expanded(
            child: NotesListView(),
          ),
        ],
      ),
    );
  }
}
