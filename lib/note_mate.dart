import 'package:flutter/material.dart';
import 'package:flutter_note_mate/features/auth/login/ui/login_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoteMate extends StatelessWidget {
  const NoteMate({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const LoginView(),
      ),
    );
  }
}
