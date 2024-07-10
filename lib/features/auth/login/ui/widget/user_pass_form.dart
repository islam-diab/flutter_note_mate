import 'package:flutter/material.dart';
import 'package:flutter_note_mate/core/helpre/extensions.dart';
import 'package:flutter_note_mate/core/routing/routes.dart';
import 'package:flutter_note_mate/core/widget/auth/app_text_bottom.dart';
import 'package:flutter_note_mate/core/widget/auth/text_form_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_note_mate/core/helpre/spase.dart';
import 'package:flutter_note_mate/core/theming/text_styles.dart';

class UserAndPassword extends StatelessWidget {
  const UserAndPassword({super.key});

  // String? emailAddress, password;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return 'Email must not be empty';
            }
            return null;
          },
          controller: TextEditingController(),
          hintText: 'Email Address',
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          prefixIcon: const Icon(Icons.person_outline),
        ),
        verticalSpace(30.h),
        AppTextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return 'Password must not be empty';
            }
            return null;
          },
          controller: TextEditingController(),
          isObscureText: false,
          hintText: 'password',
          keyboardType: TextInputType.visiblePassword,
          textInputAction: TextInputAction.done,
          prefixIcon: const Icon(Icons.key_outlined),
          suffixIcon: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.visibility,
            ),
          ),
        ),
        verticalSpace(10.h),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {
              context.pushNamed(Routes.forgotPassword);
            },
            child: Text(
              'Forgot Password !',
              style: AppTextStyles.font14Medium,
            ),
          ),
        ),
        verticalSpace(20.h),
        AppTextBottom(
          text: 'Login',
          onTap: () {},
        ),
      ],
    );
  }
}
