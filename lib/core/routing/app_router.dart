// * how to route defferent pages*
// *

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_note_mate/core/routing/routes.dart';
import 'package:flutter_note_mate/features/auth/forgot_password/ui/screen/forgot_password.dart';
import 'package:flutter_note_mate/features/auth/forgot_password/ui/screen/otp_verification.dart';
import 'package:flutter_note_mate/features/auth/login/logic/login_cubit.dart';
import 'package:flutter_note_mate/features/auth/login/ui/login_view.dart';
import 'package:flutter_note_mate/features/auth/signup/data/api/signup_api.dart';
import 'package:flutter_note_mate/features/auth/signup/logic/signup_cubit.dart';
import 'package:flutter_note_mate/features/auth/signup/data/repo/signup_repo.dart';
import 'package:flutter_note_mate/features/auth/signup/ui/signup_view.dart';
import 'package:flutter_note_mate/features/home/logic/home_cubit.dart';
import 'package:flutter_note_mate/features/home/ui/home_view.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => LoginCubit(),
            child: const LoginView(),
          ),
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => SignupCubit(
              SignupRepo(signupApi: SignupApi()),
            ),
            child: const SignupView(),
          ),
        );
      case Routes.forgotPassword:
        return MaterialPageRoute(
          builder: (_) => const ForgotPassword(),
        );
      case Routes.otpVerification:
        return MaterialPageRoute(
          builder: (_) => const OTPVerification(),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => HomeCubit(),
            child: const HomeView(),
          ),
        );
      default:
        return null;
    }
  }
}
