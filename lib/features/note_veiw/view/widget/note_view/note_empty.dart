import 'package:flutter/material.dart';
import 'package:flutter_note_mate/core/theming/text_styles.dart';

class NoteEmpty extends StatelessWidget {
  const NoteEmpty(
      {super.key, required this.text, required this.image, this.style});
  final String text, image;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(child: SizedBox.shrink()),
        SizedBox(
          width: 350,
          height: 270.73,
          child: Image.asset(image),
        ),
        Text(
          text,
          style: style ?? AppTextStyles.font20LightWhite,
        ),
        const Expanded(child: SizedBox.shrink()),
      ],
    );
  }
}
