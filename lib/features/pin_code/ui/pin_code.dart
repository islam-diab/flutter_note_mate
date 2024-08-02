import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_note_mate/core/helpre/assests.dart';
import 'package:flutter_note_mate/core/helpre/extensions.dart';
import 'package:flutter_note_mate/core/helpre/spase.dart';
import 'package:flutter_note_mate/core/routing/routes.dart';
import 'package:flutter_note_mate/core/theming/app_color.dart';
import 'package:flutter_note_mate/core/theming/text_styles.dart';
import 'package:flutter_note_mate/features/pin_code/logic/pin_code_cubit.dart';
import 'package:flutter_note_mate/features/pin_code/ui/pin_listener.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pinput/pinput.dart';

part 'otp_text_field_code.dart';
part 'fingerprint.dart';

class PinCode extends StatelessWidget {
  const PinCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: SingleChildScrollView(
        child: FractionallySizedBox(
          widthFactor: 1,
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: 250,
                  child: SvgPicture.asset(
                    AppAssests.fingerprint,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 30),
                  child: Text('Enter Your Pin',
                      style: AppTextStyles.font40SemiBoldWhite),
                ),
                const OtpTextFieldCode(),
                verticalSpace(20),
                const FingerprintAuth(),
                verticalSpace(20),
                Text(
                  'Forgot Pin Code ?',
                  style: AppTextStyles.font18Mediumyellow,
                ),
                const PinListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
