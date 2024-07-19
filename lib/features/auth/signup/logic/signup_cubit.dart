import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_note_mate/core/model/api_result.dart';
import 'package:flutter_note_mate/features/auth/signup/data/repo/signup_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_state.dart';
part 'signup_cubit.freezed.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepo signupRepo;

  SignupCubit(this.signupRepo) : super(const SignupState.initial());

  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<ResultApi> signup() async {
    emit(const SignupState.loading());
    try {
      ResultApi result = await signupRepo.signup(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
      );
      emit(const SignupState.succes());
      return ResultApi(value: result, isError: false);
    } catch (e) {
      emit(SignupState.error(error: e.toString()));
      return ResultApi(isError: true, value: e.toString());
    }
  }
}
