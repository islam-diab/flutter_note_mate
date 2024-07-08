import 'package:flutter/material.dart';
import 'package:flutter_note_mate/core/helpre/assests.dart';
import 'package:flutter_note_mate/features/auth/login/ui/widget/container_info.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          child: Column(
            children: [
              SizedBox(
                height: 230,
                child: Image.asset(AppAssests.loginAvatar),
              ),
              // Stack(
              //   children: [
              //     Image.asset(
              //       AppAssests.loginShape,
              //     ),
              //   ],
              // ),
              const ContainerInfo(),
            ],
          ),
        ),
      ),
    );
  }
}