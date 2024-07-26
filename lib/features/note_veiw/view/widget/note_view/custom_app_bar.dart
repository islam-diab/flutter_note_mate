import 'package:flutter/material.dart';
import 'package:flutter_note_mate/core/helpre/spase.dart';
import 'package:flutter_note_mate/core/theming/text_styles.dart';
import 'package:flutter_note_mate/features/note_veiw/view/widget/note_view/custom_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.suffixIcon,
    this.onPressedInSuffixIcon,
    this.perfixIcon,
    this.onPressedInPerfixIcon,
  });
  final IconData? suffixIcon;
  final void Function()? onPressedInSuffixIcon;
  final IconData? perfixIcon;
  final void Function()? onPressedInPerfixIcon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 15),
      child: Row(
        children: [
          CustomIcon(
            onPressed: onPressedInPerfixIcon,
            icon: perfixIcon,
          ),
          horizontalSpace(18),
          Text(
            title,
            style: AppTextStyles.font40SemiBoldWhite,
          ),
          const Expanded(child: SizedBox.shrink()),
          suffixIcon != null
              ? CustomIcon(
                  onPressed: onPressedInSuffixIcon,
                  icon: suffixIcon,
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
