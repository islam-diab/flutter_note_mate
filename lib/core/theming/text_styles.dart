import 'package:flutter/material.dart';
import 'package:flutter_note_mate/core/theming/app_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'font_weight_helper.dart';

class AppTextStyles {
  static TextStyle font40SemiBoldWhite = const TextStyle(
    fontSize: 40,
    fontWeight: FontWeightHelper.semiBold,
    color: Colors.white,
  );

  static TextStyle font26SemiBoldWhite = TextStyle(
    fontSize: 26.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: Colors.white,
  );

  static TextStyle font20LightWhite = TextStyle(
    fontSize: 28.sp,
    fontWeight: FontWeightHelper.extraBold,
    color: AppColor.secondaryColor,
  );

  static TextStyle font20LightRed = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.light,
    color: Colors.red,
  );

  static TextStyle font25RegularWhite = TextStyle(
    fontSize: 25.sp,
    fontWeight: FontWeightHelper.regular,
    color: Colors.white,
  );

  static TextStyle font18Medium = TextStyle(
    fontSize: 18,
    color: Colors.grey.shade700,
    fontWeight: FontWeightHelper.medium,
  );

  static TextStyle fondt18RegularWhite = TextStyle(
    fontSize: 18.sp,
    color: Colors.white,
    fontWeight: FontWeightHelper.regular,
  );

  static TextStyle font16Medium = TextStyle(
    fontSize: 16.sp,
    color: Colors.grey.shade500,
    fontWeight: FontWeightHelper.medium,
  );

  static TextStyle font18Mediumyellow = TextStyle(
    fontSize: 18.sp,
    decoration: TextDecoration.underline,
    decorationColor: Colors.yellow,
    decorationThickness: 2,
    color: Colors.yellow,
    fontWeight: FontWeightHelper.extraBold,
  );

  static TextStyle font20MediumWhite = TextStyle(
    fontSize: 20.sp,
    color: Colors.white,
    fontWeight: FontWeightHelper.medium,
  );

  static TextStyle font18MediumWhite = TextStyle(
    fontSize: 18.sp,
    color: Colors.white,
    fontWeight: FontWeightHelper.medium,
  );

  static TextStyle font35RegularWhite = TextStyle(
    fontSize: 35.sp,
    color: Colors.white,
    fontWeight: FontWeightHelper.regular,
  );
}
