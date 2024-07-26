part of '../search_view.dart';

class NoteSearchBuilder extends StatelessWidget {
  const NoteSearchBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
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
          return Expanded(
            child: NoteEmpty(
              text: 'Note not found. Try searching again.',
              style: AppTextStyles.font20LightRed,
              image: AppAssests.searchAvatar,
            ),
          );
        } else {
          return const Expanded(
            child: NoteEmpty(
              text: 'Please enter keyword to search !',
              image: AppAssests.searchAvatar,
            ),
          );
        }
      },
    );
  }
}
