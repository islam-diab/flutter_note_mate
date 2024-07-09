import 'package:flutter/material.dart';
import 'package:flutter_note_mate/core/helpre/extensions.dart';
import 'package:flutter_note_mate/core/routing/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_note_mate/core/helpre/spase.dart';
import 'package:flutter_note_mate/core/theming/text_styles.dart';
import 'package:flutter_note_mate/features/auth/signup/ui/widget/signup_form.dart';

import '../../../../../core/widget/auth/container_with_opacity.dart';
import '../../../../../core/widget/auth/logo_of_another_signup.dart';

class ContainerInfoForSignup extends StatelessWidget {
  const ContainerInfoForSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return ContainerWithOpacity(
      child: Column(
        children: [
          Text(
            'Get Started Free',
            style: AppTextStyles.font40SemiBoldWhite,
          ),
          verticalSpace(10.h),
          const SignupForm(),
          verticalSpace(15.h),
          LogoOfAnotherSignUp(
            title: 'Already have an account?',
            text: 'Login',
            onPressed: () {
              context.pushNamedAndRemoveUntil(Routes.loginScreen,
                  predicate: (route) => false);
            },
          ),
        ],
      ),
    );
  }
}
