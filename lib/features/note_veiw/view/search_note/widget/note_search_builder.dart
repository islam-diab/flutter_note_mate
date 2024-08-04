part of '../search_view.dart';

class NoteSearchBuilder extends StatelessWidget {
  const NoteSearchBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(builder: (context, state) {
      if (state is SearchNotesSucces) {
        return Expanded(
          child: ListView.builder(
            itemCount: state.results.length,
            itemBuilder: (context, index) {
              return NotesItem(notes: state.results[index]);
            },
          ),
        );
      } else if (state is SearchNotesFailure) {
        return const NoteEmpty(
          text: 'Note not found.',
          image: AppAssests.searchEmpty,
        );
      } else {
        return const NoteEmpty(
          text: 'Enter keyword to search!',
          image: AppAssests.search,
        );
      }
    });
  }
}
