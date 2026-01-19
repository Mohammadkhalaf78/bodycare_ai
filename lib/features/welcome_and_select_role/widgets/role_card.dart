// lib/widgets/role_card.dart
import 'package:bodycare_ai/core/theming/colors.dart';
import 'package:bodycare_ai/core/theming/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoleCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final bool isSelected;
  final VoidCallback? onTap;

  const RoleCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 224.h,
          width: 167.w,
          margin: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: ColorsManeger.wightColor,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: isSelected ? ColorsManeger.primary : ColorsManeger.border,
              width: isSelected ? 2 : 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(0x03),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            
              //   alignment: Alignment.topRight,
              //   child: Container(
              //     width: 24.w,
              //     height: 24.h,
              //     decoration: BoxDecoration(
              //       shape: BoxShape.circle,
              //       border: Border.all(
              //         color: ColorsManeger.gray
              //         // color:
              //         //     isSelected ? ColorsManeger.primary : ColorsManeger.border,
              //         // width: 2,
              //       ),
              //       // color:
              //       //     isSelected ? ColorsManeger.primary : Colors.transparent,
              //     ),
              //     child: isSelected
              //         ? const Icon(
              //             Icons.check,
              //             size: 16,
              //             color: Colors.white,
              //           )
              //         : null,
              //   ),
              // ),
              // SizedBox(height: 10.h),
              Container(
                width: 80.w,
                height: 80.h,
                decoration: BoxDecoration(
                  color: ColorsManeger.wightColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  size: 32,
                  color: ColorsManeger.textLight,
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                title,
                style: AppTextStyle.font18BlackBold,
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: AppTextStyle.font12GrayMedium
              ),
            ],
          ),
        ),
      ),
    );
  }
}
