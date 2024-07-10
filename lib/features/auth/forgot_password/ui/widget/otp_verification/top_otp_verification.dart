import 'package:flutter/material.dart';
import 'package:flutter_note_mate/core/helpre/spase.dart';
import 'package:flutter_note_mate/core/theming/text_styles.dart';
import 'package:flutter_note_mate/features/auth/forgot_password/ui/widget/otp_verification/pinput.dart';

class TopOTPVerification extends StatelessWidget {
  const TopOTPVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'OTP Verification',
          style: AppTextStyles.font26SemiBoldWhite,
        ),
        verticalSpace(8),
        Text(
          'Enter your OTP code number',
          style: AppTextStyles.font18Medium,
        ),
        verticalSpace(32),
        const PinputOTP(),
      ],
    );
  }
}
