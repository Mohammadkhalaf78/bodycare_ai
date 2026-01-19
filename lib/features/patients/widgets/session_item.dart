import 'package:bodycare_ai/core/theming/colors.dart';
import 'package:bodycare_ai/core/theming/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SessionItem extends StatelessWidget {
   const SessionItem({super.key,required this.ontap, required this.title, required this.date, required this.status});

   final String title;
   final String date;
   final bool status;
  final GestureTapCallback? ontap;

  @override
  Widget build(BuildContext context) {
    
    return  GestureDetector(
      onTap: ontap,
      child: Container(
        margin:  EdgeInsets.only(bottom: 12.h),
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(0x03),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          children: [
            // small icon circle
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: ColorsManeger.darkGreen.withAlpha(0x12),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.healing_outlined,
                color: ColorsManeger.darkGreen,
              ),
            ),
            const SizedBox(width: 12),
            // title + date
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(date, style: AppTextStyle.font12Grayregular),
                ],
              ),
            ),
            // status pill
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.green.withAlpha(0x12),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                status ? 'Completed' : 'Pending',
                style: TextStyle(
                  color: status ? Colors.green : Colors.orange,
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
}