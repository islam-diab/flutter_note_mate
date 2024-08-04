import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_note_mate/core/routing/app_router.dart';
import 'package:flutter_note_mate/core/routing/routes.dart';
import 'package:flutter_note_mate/features/auth/signup/data/api/cloud_firestore_api.dart';
import 'package:flutter_note_mate/features/note_veiw/data/repo/note_repo.dart';
import 'package:flutter_note_mate/features/note_veiw/logic/notes_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoteMate extends StatelessWidget {
  const NoteMate({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          NotesCubit(NoteRepo(cloudFirestoreApi: CloudFirestoreApi())),
      child: ScreenUtilInit(
        designSize: const Size(414, 896),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
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
