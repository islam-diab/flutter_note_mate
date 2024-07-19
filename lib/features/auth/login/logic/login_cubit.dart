import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_note_mate/core/model/api_result.dart';
import 'package:flutter_note_mate/features/auth/login/data/repository/login_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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

      emit(const LoginState.succes());
      return ResultApi(value: resultApi, isError: false);
    } catch (e) {
      emit(LoginState.error(error: e.toString()));
      return ResultApi(isError: true, value: e.toString());
    }
  }
}
