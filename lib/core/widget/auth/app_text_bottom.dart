import 'package:flutter/material.dart';
import 'package:flutter_note_mate/core/theming/text_styles.dart';

class AppTextBottom extends StatelessWidget {
  const AppTextBottom({
    super.key,
    required this.onTap,
    required this.text,
    this.isLoading = false,
  });
  final void Function()? onTap;
  final String text;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.zero,
        height: 55,
        decoration: ShapeDecoration(
          gradient: const LinearGradient(
            begin: Alignment(1.00, -0.01),
            end: Alignment(-1, 0.01),
            colors: [Color(0xFF9C3FE4), Color(0xFFC65647)],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Center(
          child: isLoading
              ? const SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
              : Text(
                  text,
                  style: AppTextStyles.font18MediumWhite,
                ),
        ),
      ),
    );
  }
}
