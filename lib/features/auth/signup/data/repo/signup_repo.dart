import 'package:flutter_note_mate/core/helpre/is_connected_network.dart';
import 'package:flutter_note_mate/core/model/api_result.dart';
import 'package:flutter_note_mate/core/model/app_user.dart';
import 'package:flutter_note_mate/features/auth/signup/data/api/cloud_firestore_api.dart';
import 'package:flutter_note_mate/features/auth/signup/data/api/signup_api.dart';

class SignupRepo {
  final SignupApi signupApi;
  final CloudFirestoreApi cloudFirestoreApi;
  const SignupRepo(this.cloudFirestoreApi, {required this.signupApi});
  Future<ResultApi> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    if (await isConnectedNetwork()) {
      try {
        ResultApi result =
            await signupApi.signUp(email: email, password: password);
        AppUser appUser = AppUser(uid: result.value, email: email, name: name);
        await cloudFirestoreApi.setUserData(
          documentId: result.value,
          data: appUser.toJson(),
        );

        return ResultApi(value: result, isError: false);
      } catch (e) {
        return ResultApi(isError: true, value: e.toString());
      }
    } else {
      return ResultApi(isError: true, value: 'No internet connection');
    }
  }
}
