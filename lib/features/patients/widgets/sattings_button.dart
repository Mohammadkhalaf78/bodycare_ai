import 'package:bodycare_ai/core/helpers/spacing.dart';
import 'package:bodycare_ai/core/theming/colors.dart';
import 'package:bodycare_ai/core/theming/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SattingsButton extends StatelessWidget {
  const SattingsButton({super.key, this.onTap, this.title, this.icon});
  final VoidCallback? onTap;
  final String? title;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: ColorsManeger.wightColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 20.sp,
              backgroundColor: ColorsManeger.transparentGreen,
              child: Icon(
                icon,
                size: 25,
                color: ColorsManeger.darkGreen,
              ),
            ),
            horizontalSpace(10),
            Text('$title', style: AppTextStyle.font14GrayMedium),
            Spacer(),
            Icon(

              Icons.chevron_right_outlined,
              size: 25.sp,
              color: ColorsManeger.gray,
            ),
          ],
        ),
      ),
    );
  }
}
