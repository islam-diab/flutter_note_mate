import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_note_mate/features/note_veiw/cubit/notes_cubit.dart';
import 'package:flutter_note_mate/features/note_veiw/models/note_model.dart';
import 'package:flutter_note_mate/features/note_veiw/view/widget/edit_note/edit_note.dart';

class NotesItem extends StatelessWidget {
  const NotesItem({super.key, required this.notes});
  final NoteModel notes;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return EditeNoteView(
                note: notes,
              );
            }),
          );
        },
        child: Container(
          padding: const EdgeInsets.only(top: 20, left: 16, bottom: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Color(notes.color)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: Text(
                  notes.title,
                  style: const TextStyle(
                    fontSize: 28,
                    color: Colors.black,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    truncateText(notes.content, 2),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    notes.delete();
                    context.read<NotesCubit>().fetchAllNotes();
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Text(
                  notes.date,
                  style: TextStyle(
                    // fontSize: 28,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Function to truncate text to a specified number of lines
String truncateText(String text, int maxLines) {
  List<String> lines = text.split('\n');
  if (lines.length > maxLines) {
    return '${lines.take(maxLines).join('\n')}...';
  } else {
    return text;
  }
}
