import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_note_mate/core/helpre/assests.dart';
import 'package:flutter_note_mate/core/helpre/spase.dart';
import 'package:flutter_note_mate/core/theming/text_styles.dart';

class LogoOfAnotherSignUp extends StatelessWidget {
  const LogoOfAnotherSignUp({
    super.key,
    required this.text,
    required this.onPressed,
    required this.title,
  });
  final String text;
  final String title;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset(
                AppAssests.lineLeft,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'Or continue with',
                style: AppTextStyles.font16Medium,
              ),
            ),
            Expanded(
              child: Image.asset(
                AppAssests.lineRight,
              ),
            ),
          ],
        ),
        verticalSpace(20.h),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 90),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 60.w,
                child: Image.asset(AppAssests.google),
              ),
              SizedBox(
                width: 60.w,
                child: Image.asset(AppAssests.facebook),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: AppTextStyles.font16Medium,
            ),
            TextButton(
              onPressed: onPressed,
              child: Text(
                text,
                style: AppTextStyles.font16Medium
                    .copyWith(color: const Color(0xffB14A96)),
              ),
            ),
          ],
        )
      ],
    );
  }
}
