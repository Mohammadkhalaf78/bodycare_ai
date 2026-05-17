// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:bodycare_ai/core/theming/colors.dart';
import 'package:bodycare_ai/core/theming/style.dart';

class AppTextFormFiled extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isObscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  final Color? backGrgroundColor;
  final Widget? suffixIcons;
  final Widget? prefixIcon;
  const AppTextFormFiled({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.isObscureText,
    this.controller,
    this.backGrgroundColor,
    this.suffixIcons,
    this.prefixIcon,
    this.validator,
  });

  @override
  Widget build(BuildContextcontext) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        errorBorder:
            enabledBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1.3),
              borderRadius: BorderRadius.circular(16),
            ),
        focusedErrorBorder:
            focusedBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1.3),
              borderRadius: BorderRadius.circular(16),
            ),
        errorStyle: TextStyle(
          color: Colors.red,
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
        ),
        isDense: true,
        hintStyle: hintStyle ?? AppTextStyle.font16GrayRegular,
        hintText: hintText,
        suffixIcon: suffixIcons,
        prefixIcon: prefixIcon,

        contentPadding:
            contentPadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
        focusedBorder:
            focusedBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorsManeger.darkGreen,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
        enabledBorder:
            enabledBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorsManeger.gray.withValues(alpha: 0.5),
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
        filled: true,
        fillColor:
            backGrgroundColor ?? ColorsManeger.mainBlue.withValues(alpha: 0.1),
      ),
      obscureText: isObscureText ?? false,
      style: AppTextStyle.font12GrayMedium,
    );
  }
}
