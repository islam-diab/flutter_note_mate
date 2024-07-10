import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_note_mate/core/theming/text_styles.dart';
import 'package:pinput/pinput.dart';

class PinputOTP extends StatelessWidget {
  const PinputOTP({super.key});

  @override
  Widget build(BuildContext context) {
    return Pinput(
      showCursor: true,
      cursor: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 9),
            width: 22,
            height: 1,
            color: Colors.white,
          ),
        ],
      ),
      onCompleted: (pin) {},
      length: 6,
      defaultPinTheme: PinTheme(
        width: 70.w,
        height: 60.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.sp),
          border: Border.all(
            color: const Color.fromARGB(255, 195, 30, 30),
          ),
        ),
      ),
      submittedPinTheme: PinTheme(
        width: 70.w,
        height: 60.h,
        textStyle: AppTextStyles.font20MediumWhite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.sp),
          border: Border.all(
            color: const Color.fromARGB(255, 4, 224, 62),
          ),
        ),
      ),
      focusedPinTheme: PinTheme(
        width: 70.w,
        height: 60.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.sp),
          border: Border.all(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
