part of 'pin_code_cubit.dart';

@immutable
abstract class PinCodeState {}

class PinCodeInitial extends PinCodeState {}

class PinCodeLoading extends PinCodeState {}

class PinCodeSucces extends PinCodeState {}

class PinCodeError extends PinCodeState {
  final String error;
  PinCodeError(this.error);
}
