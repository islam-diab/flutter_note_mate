part of 'signup_cubit.dart';

@freezed
class SignupState with _$SignupState {
  const factory SignupState.initial() = _Initial;

  const factory SignupState.loading() = Loading;

  const factory SignupState.succes() = Succes;

  const factory SignupState.error({required String error}) = Error;
}
