import 'package:bodycare_ai/core/helpers/spacing.dart';
import 'package:bodycare_ai/core/theming/colors.dart';
import 'package:bodycare_ai/core/theming/style.dart';
import 'package:bodycare_ai/features/users/data/models/doctors_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NameAndPhotoDoctor extends StatelessWidget {
  final FormattedDoctor doctorsDatails;
  const NameAndPhotoDoctor({super.key, required this.doctorsDatails});

  FormattedDoctor get doctor => doctorsDatails;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(6), // للحافة البيضاء
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: .08),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: CircleAvatar(
              radius: 48,
              backgroundImage: NetworkImage(
                'https://cdn.pixabay.com/photo/2023/12/21/06/23/doctor-8461303_1280.jpg',
              ),
            ),
          ),

          verticalSpace(8),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(doctor.name, style: AppTextStyle.font18BlackBold),
              // علامة التايكيد
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(2),
                child: const Icon(
                  Icons.verified,
                  color: Color(0xFF2BB673),
                  size: 18,
                ),
              ),
            ],
          ),
          verticalSpace(6),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: ColorsManeger.transparentGreen,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              doctor.specialty,
              style: AppTextStyle.font14GreenRegular,
            ),
          ),
        ],
      ),
    );
  }
}
