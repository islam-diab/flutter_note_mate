import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_note_mate/core/theming/color.dart';

import 'font_weight_helper.dart';

class AppTextStyles {
  static TextStyle font18BoldBlack = TextStyle(
    fontSize: 18.sp,
    color: Colors.black,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font40SemiBoldWhite = TextStyle(
    fontSize: 40.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: Colors.white,
  );

  static TextStyle font26SemiBoldWhite = TextStyle(
    fontSize: 26.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: Colors.white,
  );

  static TextStyle font20SemiBold = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle font13SemiBold = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeightHelper.semiBold,
  );

  static TextStyle font18Medium = TextStyle(
    fontSize: 18.sp,
    color: Colors.grey.shade700,
    fontWeight: FontWeightHelper.medium,
  );

  static TextStyle fondt18RegularWhite = TextStyle(
    fontSize: 18.sp,
    color: Colors.white,
    fontWeight: FontWeightHelper.regular,
    
  );

  static TextStyle font14Medium = TextStyle(
    fontSize: 14.sp,
    color: Colors.grey.shade700,
    fontWeight: FontWeightHelper.medium,
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

  static TextStyle font16Regular = TextStyle(
    fontSize: 16.sp,
    color: AppColor.rhythm,
    fontWeight: FontWeightHelper.regular,
  );
}
