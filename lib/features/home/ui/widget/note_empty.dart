import 'package:flutter/material.dart';
import 'package:flutter_note_mate/core/helpre/assests.dart';
import 'package:flutter_note_mate/core/theming/text_styles.dart';

class NoteEmpty extends StatelessWidget {
  const NoteEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(child: SizedBox.shrink()),
        SizedBox(
          width: 350,
          height: 286.73,
          child: Image.asset(AppAssests.homeVictor),
        ),
        Text(
          'Welcome to Note Mate!',
          style: AppTextStyles.font20LightWhite,
        ),
        const Expanded(child: SizedBox.shrink()),
      ],
    );
  }
}
