import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_note_mate/core/helpre/app_constant.dart';
import 'package:flutter_note_mate/core/model/api_result.dart';
import 'package:flutter_note_mate/core/model/app_user.dart';
import 'package:flutter_note_mate/features/auth/login/data/repository/login_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginRepo) : super(const LoginState.initial());
  final LoginRepository _loginRepo;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  Future<ResultApi> login() async {
    emit(const LoginState.loading());
    try {
      ResultApi resultApi = await _loginRepo.login(
        emailController.text.trim(),
        passwordController.text.trim(),
      );

      // Map<String, dynamic> result = resultApi.value;

      AppUser appUser = AppUser.fromJson(resultApi.value);

      // Save user information to Hive
      var userBox = Hive.box<AppUser>(AppConstant.userBox);

      // Save with a specific key
      await userBox.put(AppConstant.currentUser, appUser);

      emit(const LoginState.succes());
      return ResultApi(value: resultApi, isError: false);
    } catch (e) {
      emit(LoginState.error(error: e.toString()));

      return ResultApi(isError: true, value: e.toString());
    }
  }
}
