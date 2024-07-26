import 'package:flutter/material.dart';
import 'package:flutter_note_mate/core/helpre/extensions.dart';
import 'package:flutter_note_mate/core/helpre/spase.dart';
import 'package:flutter_note_mate/core/routing/routes.dart';
import 'package:flutter_note_mate/core/widget/auth/container_with_opacity.dart';
import 'package:flutter_note_mate/core/widget/auth/logo_of_another_signup.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/text_styles.dart';
import 'user_pass_form.dart';

class ContainerInfo extends StatelessWidget {
  const ContainerInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return ContainerWithOpacity(
      child: Column(
        children: [
          Text(
            'Welcome Back !',
            style: AppTextStyles.font40SemiBoldWhite,
          ),
          Text(
            'welcome back we missed you',
            style: AppTextStyles.font16Medium,
          ),
          verticalSpace(20.h),
          const UserAndPassword(),
          verticalSpace(20.h),
          LogoOfAnotherSignUp(
            title: 'Don\'t have an account ? ',
            text: 'Sing Up',
            onPressed: () {
              context.pushNamed(Routes.signUpScreen);
            },
          ),
        ],
      ),
    );
  }
}
