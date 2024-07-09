import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_note_mate/core/helpre/spase.dart';
import 'package:flutter_note_mate/core/widget/auth/text_form_field.dart';

import '../../../../../core/widget/auth/app_text_bottom.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextFormField(
          controller: TextEditingController(),
          hintText: 'username',
          keyboardType: TextInputType.name,
          prefixIcon: const Icon(Icons.person_outline),
          textInputAction: TextInputAction.next,
          validator: (value) {
            if (value!.isEmpty) {
              return 'username must not be empty';
            }
            return null;
          },
        ),
        verticalSpace(15.h),
        AppTextFormField(
          controller: TextEditingController(),
          hintText: 'Email Address',
          keyboardType: TextInputType.emailAddress,
          prefixIcon: const Icon(Icons.email_outlined),
          textInputAction: TextInputAction.next,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Email must not be empty';
            }
            return null;
          },
        ),
        verticalSpace(15.h),
        AppTextFormField(
          controller: TextEditingController(),
          hintText: 'password',
          isObscureText: true,
          keyboardType: TextInputType.visiblePassword,
          prefixIcon: const Icon(Icons.key_outlined),
          suffixIcon: const Icon(Icons.remove_red_eye_outlined),
          textInputAction: TextInputAction.next,
          validator: (value) {
            if (value!.isEmpty) {
              return 'password must not be empty';
            }
            return null;
          },
        ),
        verticalSpace(15.h),
        AppTextFormField(
          controller: TextEditingController(),
          hintText: 'Confirm password',
          isObscureText: true,
          keyboardType: TextInputType.visiblePassword,
          prefixIcon: const Icon(Icons.key_outlined),
          suffixIcon: const Icon(Icons.remove_red_eye_outlined),
          textInputAction: TextInputAction.done,
          validator: (value) {
            if (value!.isEmpty) {
              return 'password must not be empty';
            }
            return null;
          },
        ),
        verticalSpace(20.h),
        AppTextBottom(
          text: 'Signup',
          onTap: () {},
        ),
      ],
    );
  }
}
