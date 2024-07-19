part of 'login_cubit.dart';

@freezed
class LoginState<T> with _$LoginState<T> {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = Loading;
  const factory LoginState.succes() = Succes;
  const factory LoginState.error({required String error}) = Error;
}
