import 'package:flutter/material.dart';
import 'package:flutter_note_mate/core/helpre/assests.dart';
import 'package:flutter_note_mate/features/auth/signup/ui/widget/container_info_signup.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          child: Column(
            children: [
              Image.asset(AppAssests.loginAvatar),
              const ContainerInfoForSignup(),
            ],
          ),
        ),
      ),
    );
  }
}
