import 'package:flutter/material.dart';
import 'package:flutter_note_mate/core/routing/app_router.dart';
import 'package:flutter_note_mate/core/routing/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoteMate extends StatelessWidget {
  const NoteMate({super.key, required this.appRouter});
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Nunito',
          useMaterial3: true,
        ),
        onGenerateRoute: appRouter.generateRoute,
        initialRoute: Routes.loginScreen,
      ),
    );
  }
}
