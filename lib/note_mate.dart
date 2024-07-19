import 'package:firebase_auth/firebase_auth.dart';
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
        home: FutureBuilder<String>(
          future: _checkIfUserIsLoggedIn(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              return Navigator(
                onGenerateRoute: appRouter.generateRoute,
                initialRoute: snapshot.data,
              );
            } else {
              return const Center(child: Text('Something went wrong!'));
            }
          },
        ),
      ),
    );
  }
}

// Check if user is logged in
Future<String> _checkIfUserIsLoggedIn() async {
  final FirebaseAuth auth = FirebaseAuth.instance;
  User? user = auth.currentUser;
  if (user != null) {
    // User is signed in
    return Routes.homeScreen;
  } else {
    // No user is signed in
    return Routes.loginScreen;
  }
}
