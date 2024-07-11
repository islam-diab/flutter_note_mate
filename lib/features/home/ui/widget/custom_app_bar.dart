import 'package:flutter/material.dart';
import 'package:flutter_note_mate/core/helpre/spase.dart';
import 'package:flutter_note_mate/core/theming/text_styles.dart';
import 'package:flutter_note_mate/features/home/ui/widget/custom_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.onPressed,
    required this.suffixIcon,
    required this.perfixIcon,
  });
  final IconData suffixIcon;
  final IconData perfixIcon;
  final String title;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 15),
      child: Row(
        children: [
          CustomIcon(
            onPressed: onPressed,
            icon: perfixIcon,
          ),
          horizontalSpace(18),
          Text(
            title,
            style: AppTextStyles.font40SemiBoldWhite,
          ),
          const Expanded(child: SizedBox.shrink()),
          CustomIcon(
            onPressed: onPressed,
            icon: suffixIcon,
          ),
        ],
      ),
    );
  }
}
