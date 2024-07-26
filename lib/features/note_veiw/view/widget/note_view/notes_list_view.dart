import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_note_mate/core/helpre/assests.dart';
import 'package:flutter_note_mate/features/note_veiw/logic/notes_cubit.dart';
import 'package:flutter_note_mate/features/note_veiw/view/widget/note_view/note_empty.dart';
import 'package:flutter_note_mate/features/note_veiw/view/widget/note_view/notes_item.dart';

import '../../../data/models/note_model.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).notes!;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: notes.isEmpty
              ? const NoteEmpty(
                text:  'Welcome to Note Mate!',
                image: AppAssests.homeVictor,
              )
              : ListView.builder(
                  itemCount: notes.length,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return NotesItem(
                      notes: notes[index],
                    );
                  }),
        );
      },
    );
  }
}
