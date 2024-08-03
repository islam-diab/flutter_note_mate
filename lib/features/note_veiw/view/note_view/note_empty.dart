import 'package:flutter/material.dart';
import 'package:flutter_note_mate/core/theming/text_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoteEmpty extends StatelessWidget {
  const NoteEmpty({
    super.key,
    required this.text,
    required this.image,
  });
  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(image),
        Text(
          text,
          style: AppTextStyles.font20LightWhite,
        ),
      ],
    );
  }
}
