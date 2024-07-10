import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_note_mate/core/helpre/spase.dart';
import 'package:flutter_note_mate/core/widget/auth/app_text_bottom.dart';
import 'package:flutter_note_mate/core/widget/auth/container_with_opacity.dart';
import 'package:flutter_note_mate/features/auth/forgot_password/ui/widget/forgot_passwored/top_forgot_passwored.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: ContainerWithOpacity(
          inAuth: false,
          child: Padding(
            padding: EdgeInsets.only(top: 60.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TopForgotPassword(),
                const Expanded(child: SizedBox()),
                AppTextBottom(
                  onTap: () {},
                  text: 'Reset Password',
                ),
                verticalSpace(50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
