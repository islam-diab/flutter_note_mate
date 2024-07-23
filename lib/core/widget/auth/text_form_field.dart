// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_note_mate/core/theming/text_styles.dart';

class AppTextFormField extends StatelessWidget {
  final Function()? onTap;
  final String hintText;
  final int? maxLine;
  final bool readOnly;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isObscureText;
  final TextInputType? keyboardType;
  final TextInputAction textInputAction;
  final Function(String?) validator;
  final TextEditingController controller;
  final double? width;

  const AppTextFormField({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.isObscureText = false,
    required this.validator,
    required this.controller,
    this.readOnly = false,
    this.onTap,
    this.width,
     this.keyboardType,
    required this.textInputAction,
    this.maxLine = 1,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        children: [
          TextFormField(
            onTap: onTap,
            maxLines: maxLine,
            readOnly: readOnly,
            validator: (value) {
              return validator(value);
            },
            controller: controller,
            keyboardType: keyboardType,
            obscureText: isObscureText,
            textInputAction: textInputAction,
            style: AppTextStyles.font14Medium,
            decoration: InputDecoration(
              fillColor: Colors.grey.withOpacity(0.1),
              filled: true,
              isDense: true,
              hintStyle: AppTextStyles.font14Medium,
              hintText: hintText,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 20.h,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
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
      ),
    );
  }
}
