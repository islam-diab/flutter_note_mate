import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_note_mate/core/helpre/is_connected_network.dart';
import 'package:flutter_note_mate/core/model/api_result.dart';

class LoginApi {
  Future<ResultApi> login(String email, String password) async {
    if (await isConnectedNetwork()) {
      try {
        // login with email and password use firebase
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        return ResultApi(isError: false, value: credential.user!.uid);
      } on FirebaseAuthException catch (e) {
        return ResultApi(isError: true, value: e.toString());
      } catch (e) {
        return ResultApi(isError: true, value: e.toString());
      }
    } else {
      return ResultApi(isError: true, value: 'No internet connection');
    }
  }
}
