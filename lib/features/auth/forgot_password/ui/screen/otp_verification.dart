import 'package:flutter/material.dart';
import 'package:flutter_note_mate/core/helpre/extensions.dart';
import 'package:flutter_note_mate/core/routing/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_note_mate/core/helpre/spase.dart';
import 'package:flutter_note_mate/core/theming/text_styles.dart';
import 'package:flutter_note_mate/core/widget/auth/app_text_bottom.dart';
import 'package:flutter_note_mate/core/widget/auth/container_with_opacity.dart';
import 'package:flutter_note_mate/features/auth/forgot_password/ui/widget/otp_verification/top_otp_verification.dart';

class OTPVerification extends StatelessWidget {
  const OTPVerification({super.key});

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
              children: [
                const TopOTPVerification(),
                verticalSpace(50),
                Text(
                  'Didn\'t receive code ?',
                  style: AppTextStyles.fondt18RegularWhite,
                ),
                Text(
                  'Resend',
                  style: AppTextStyles.fondt18RegularWhite.copyWith(
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.white,
                    decorationThickness: 2,
                  ),
                ),
                const Expanded(child: SizedBox()),
                AppTextBottom(
                  onTap: () {
                    context.pushNamed(Routes.homeScreen);
                  },
                  text: 'Submit',
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
