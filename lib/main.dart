import 'package:flutter/material.dart';
import 'package:flutter_note_mate/core/routing/app_router.dart';
import 'package:flutter_note_mate/note_mate.dart';

void main() {
  runApp( NoteMate(
    appRouter: AppRouter(),
  ));
}
