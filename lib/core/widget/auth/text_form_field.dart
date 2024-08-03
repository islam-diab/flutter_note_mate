// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_note_mate/core/theming/app_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_note_mate/core/theming/text_styles.dart';

class AppTextFormField extends StatelessWidget {
  final Function()? onTap;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final String? hintText;
  final int? maxLine;
  final bool readOnly;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isObscureText;
  final TextInputType? keyboardType;
  final TextInputAction textInputAction;
  final Function(String?)? validator;
  final TextEditingController controller;

  const AppTextFormField({
    super.key,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.isObscureText = false,
    this.validator,
    required this.controller,
    this.readOnly = false,
    this.onTap,
    this.keyboardType,
    required this.textInputAction,
    this.maxLine = 1,
    this.onChanged,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          onTap: onTap,
          onChanged: onChanged,
          onFieldSubmitted: onFieldSubmitted,
          maxLines: maxLine,
          readOnly: readOnly,
          validator: (value) {
            if (validator != null) {
              return validator!(value);
            }
            return null;
          },
          controller: controller,
          keyboardType: keyboardType,
          obscureText: isObscureText,
          textInputAction: textInputAction,
          style: AppTextStyles.font18MediumWhite,
          decoration: InputDecoration(
            fillColor: Colors.grey.withOpacity(0.1),
            filled: true,
            isDense: true,
            hintStyle: AppTextStyles.font16Medium,
            hintText: hintText,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 20.h,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColor.secondaryColor,
                width: 1.3.w,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: const Color(0xFFEDEDED),
                width: 1.3.w,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
        ),
      ],
    );
  }
}
