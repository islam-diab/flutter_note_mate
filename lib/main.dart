import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_note_mate/core/routing/app_router.dart';
import 'package:flutter_note_mate/note_mate.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();

  runApp(
    NoteMate(appRouter: AppRouter()),
  );
}
