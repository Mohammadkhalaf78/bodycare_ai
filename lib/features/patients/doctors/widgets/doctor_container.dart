import 'package:bodycare_ai/core/helpers/spacing.dart';
import 'package:bodycare_ai/core/theming/colors.dart';
import 'package:bodycare_ai/core/theming/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorContainer extends StatelessWidget {
  const DoctorContainer({
    super.key,
    required this.urs,
    required this.name,
    required this.specialty,
    required this.rating,
    required this.reviewsCount,
  });
  final String urs;
  final String name;
  final String specialty;
  final double rating;
  final int reviewsCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorsManeger.darkGreen,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24.sp),
          bottomRight: Radius.circular(24.sp),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(77.sp),
              child: Image.network(
                height: 120.h,
                width: 120.w,
                fit: BoxFit.cover,
                urs,
              ),
            ),
            verticalSpace(12),
            Text(name, style: AppTextStyle.font18WhiteBold),
            Text(specialty, style: AppTextStyle.font10weightReguler),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.star, size: 18, color: Colors.white),

                Text(
                  rating.toString(),
                  style: AppTextStyle.font10weightReguler,
                ),
                horizontalSpace(3),
                Text(
                  '($reviewsCount reviews)',
                  style: AppTextStyle.font10weightReguler,
                ),
              
              ],
            ),
              Text(
                  'Gige Egypt, 6 october city ',
                  style: AppTextStyle.font10weightReguler,
                ),
          ],
        ),
      ),
    );
  }
}
