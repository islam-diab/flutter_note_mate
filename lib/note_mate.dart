import 'package:flutter/material.dart';
import 'package:flutter_note_mate/features/auth/login/ui/login_view.dart';

class NoteMate extends StatelessWidget {
  const NoteMate({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const LoginView(),
    );
  }
}
