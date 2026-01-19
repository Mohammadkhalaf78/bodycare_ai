import 'package:bodycare_ai/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    super.key,
    this.borderRadius,
    this.backgroundColor,
    this.horizontalpadding,
    this.verticalPadding,
    this.buttonWidh,
    this.buttonHeight,
    required this.textStyle,
    required this.onPressed,
    required this.buttonText,
  });
  final double? borderRadius;
  final Color? backgroundColor;
  final double? horizontalpadding;
  final double? verticalPadding;
  final double? buttonWidh;
  final double? buttonHeight;
  final TextStyle textStyle;
  final VoidCallback onPressed;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(borderRadius ?? 16),
          ),
        ),
        backgroundColor: WidgetStatePropertyAll(
          backgroundColor ?? ColorsManeger.darkGreen,
        ),
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(
            horizontal: horizontalpadding?.w ?? 12.w,
            vertical: verticalPadding?.h ?? 14.h,
          ),
        ),
        fixedSize: WidgetStatePropertyAll(
          Size(buttonWidh?.w ?? double.maxFinite, buttonHeight?.h ?? 55.h),
        ),
      ),

      onPressed: onPressed,
      child: Text(buttonText, style: textStyle),
    );
  }
}
