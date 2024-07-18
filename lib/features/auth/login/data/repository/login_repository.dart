import 'package:flutter_note_mate/core/model/api_result.dart';
import 'package:flutter_note_mate/features/auth/login/data/api/login_api.dart';

class LoginRepository {
  final LoginApi loginApi;
  LoginRepository({required this.loginApi});
  Future<ResultApi> login(String email, String password) async {
    try {
      ResultApi result = await loginApi.login(email, password);
      return ResultApi(value: result, isError: false);
    } catch (e) {
      return ResultApi(isError: true, value: e.toString());
    }
  }
}
