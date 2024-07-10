import 'package:flutter/material.dart';
import 'package:flutter_note_mate/core/helpre/spase.dart';
import 'package:flutter_note_mate/core/theming/text_styles.dart';
import 'package:flutter_note_mate/core/widget/auth/text_form_field.dart';

class TopForgotPassword extends StatelessWidget {
  const TopForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Forgot Password',
          style: AppTextStyles.font26SemiBoldWhite,
        ),
        verticalSpace(8),
        Text(
          'At our app, we take the security of \nyour information seriously.',
          style: AppTextStyles.font18Medium,
        ),
        verticalSpace(32),
        AppTextFormField(
          hintText: 'Ener your email',
          controller: TextEditingController(),
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            return 'Email must not be empty';
          },
          textInputAction: TextInputAction.done,
        ),
      ],
    );
  }
}
