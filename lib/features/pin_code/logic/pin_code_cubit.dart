import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_auth/local_auth.dart';

part 'pin_code_state.dart';

class PinCodeCubit extends Cubit<PinCodeState> {
  PinCodeCubit() : super(PinCodeInitial());
  final LocalAuthentication auth = LocalAuthentication();
  Future<void> fingerprint() async {
    bool isAuth = false;
    try {
      isAuth = await auth.authenticate(
        localizedReason: 'Scan your fingerprint or face to authenticate',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
      if (isAuth) {
        emit(PinCodeSucces());
      } 
    } catch (e) {
      emit(PinCodeError(e.toString()));
      debugPrint(e.toString());
    }
  }
}
