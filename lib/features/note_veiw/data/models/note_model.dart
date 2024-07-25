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

  NoteModel({
    required this.title,
    required this.content,
    required this.date,
    required this.color,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'content': content,
      'date': date,
      'color': color,
    };
  }

  NoteModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        content = json['content'],
        date = json['date'],
        color = json['color'];
}
