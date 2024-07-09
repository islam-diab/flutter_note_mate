// * how to route defferent pages*
// *

import 'package:flutter/material.dart';
import 'package:flutter_note_mate/core/routing/routes.dart';
import 'package:flutter_note_mate/features/auth/login/ui/login_view.dart';
import 'package:flutter_note_mate/features/auth/signup/ui/signup_view.dart';
import 'package:flutter_note_mate/features/home/ui/home_view.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginView(),
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => const SignupView(),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeView(),
        );
      default:
        return null;
    }
  }
}
