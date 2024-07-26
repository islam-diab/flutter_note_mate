import 'package:hive/hive.dart';

part 'note_model.g.dart';

@HiveType(typeId: 1)
class NoteModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String content;
  @HiveField(2)
  final String date;
  @HiveField(3)
  int color;
  @HiveField(4)
  String noteId;

  NoteModel({
    required this.title,
    required this.content,
    required this.date,
    required this.color,
    required this.noteId,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'content': content,
      'date': date,
      'color': color,
      'noteId': noteId
    };
  }

  NoteModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        content = json['content'],
        date = json['date'],
        color = json['color'],
        noteId = json['noteId'];
}
