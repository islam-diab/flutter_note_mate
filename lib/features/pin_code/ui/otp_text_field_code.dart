part of 'pin_code.dart';

class OtpTextFieldCode extends StatelessWidget {
  const OtpTextFieldCode({super.key});
  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = Colors.green;
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = Colors.white;

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 70,
      textStyle: const TextStyle(
        fontSize: 50,
        color: Colors.white,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );
// pin code widget
    return Pinput(
      obscureText: true,
      defaultPinTheme: defaultPinTheme,
      separatorBuilder: (index) => const SizedBox(width: 8),
      validator: (value) {
        return value == '2222' ? null : 'Pin is incorrect';
      },
      hapticFeedbackType: HapticFeedbackType.lightImpact,
      onCompleted: (pin) {
        debugPrint('onCompleted: $pin');
        pin == '2222' ? context.pushNamed(Routes.homeScreen) : null;
      },
      cursor: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 9),
            width: 22,
            height: 1,
            color: focusedBorderColor,
          ),
        ],
      ),
      focusedPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: focusedBorderColor),
        ),
      ),
      submittedPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          color: fillColor,
          borderRadius: BorderRadius.circular(19),
          border: Border.all(color: focusedBorderColor),
        ),
      ),
      errorPinTheme: defaultPinTheme.copyBorderWith(
        border: Border.all(color: Colors.redAccent),
      ),
    );
  }
}
