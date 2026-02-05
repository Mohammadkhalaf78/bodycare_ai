import 'package:bodycare_ai/core/helpers/spacing.dart';
import 'package:bodycare_ai/core/theming/style.dart';
import 'package:bodycare_ai/features/users/data/models/doctors.dart';
import 'package:bodycare_ai/features/users/data/models/doctors_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrDetailsContent extends StatelessWidget {
  final FormattedDoctor doctor;
  const DrDetailsContent({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 6.h,
              width: 60.w,
              decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(6)),
            ),
            const SizedBox(height: 12),
            Text(
              doctor.name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
             verticalSpace(8),
            Text(
              doctor.specialty,
              style: const TextStyle(height: 1.5),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF15A678),
                minimumSize: const Size.fromHeight(48),
              ),
              child:  Text('Close',style:AppTextStyle.font14WightMedium,),
            ),
            const SizedBox(height: 18),
          ],
        ),
      ),
    );
  }
}

