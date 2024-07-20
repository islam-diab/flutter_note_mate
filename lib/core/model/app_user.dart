import 'package:hive/hive.dart';

part 'app_user.g.dart';

@HiveType(typeId: 0)
class AppUser extends HiveObject {
  @HiveField(0)
  final String uid;
  
  @HiveField(1)
  final String email;

  @HiveField(2)
  final String name;

  AppUser({required this.uid, required this.email, required this.name});

  // from json
  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
      uid: json['uid'],
      email: json['email'],
      name: json['name'],
    );
  }

  //to json
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['email'] = email;
    data['name'] = name;
    return data;
  }
}
