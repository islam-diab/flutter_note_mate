import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_note_mate/core/helpre/app_constant.dart';
import 'package:flutter_note_mate/core/model/app_user.dart';
import 'package:flutter_note_mate/core/routing/app_router.dart';
import 'package:flutter_note_mate/features/note_veiw/models/note_model.dart';
import 'package:flutter_note_mate/note_mate.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();

  // Register the adapters
  Hive.registerAdapter(AppUserAdapter());
  Hive.registerAdapter(NoteModelAdapter());

  // Open the boxes
  await Hive.openBox<AppUser>(HiveConstant.userBox);
  await Hive.openBox<NoteModel>(HiveConstant.noteBox);

  runApp(
    NoteMate(appRouter: AppRouter()),
  );
}
