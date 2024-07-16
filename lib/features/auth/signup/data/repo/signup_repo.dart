import 'package:flutter_note_mate/core/model/api_result.dart';
import 'package:flutter_note_mate/features/auth/signup/data/api/signup_api.dart';

class SignupRepo {
  final SignupApi signupApi;
  const SignupRepo({required this.signupApi});
  Future<ResultApi> signup({
    required String email,
    required String password,
  }) async {
    try {
      ResultApi result =
          await signupApi.signUp(email: email, password: password);
      return ResultApi(value: result, isError: false);
    } catch (e) {
      return ResultApi(isError: true, value: e.toString());
    }
  }
}
