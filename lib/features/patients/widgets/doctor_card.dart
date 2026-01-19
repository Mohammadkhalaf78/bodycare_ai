import 'package:bodycare_ai/core/helpers/spacing.dart';
import 'package:bodycare_ai/core/theming/colors.dart';
import 'package:bodycare_ai/core/theming/style.dart';
import 'package:bodycare_ai/features/users/data/models/doctor_model.dart';
import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  final DoctorModel doctor;
  final VoidCallback? onBook;

  const DoctorCard({
    super.key,
    required this.doctor,
    this.onBook,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      // height: 120.h, // 👈 أقل من 200
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: ColorsManeger.wightColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .2),
            blurRadius: 8,
            offset: const Offset(0, 0.4),
          ),
        ],
      ),
      child: Row(
        children: [
          /// صورة الدكتور
          ClipRRect(
            borderRadius: BorderRadius.circular(44),
            child: Image.network(
              doctor.imageUrl,
              width: 70,
              height: 70,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                width: 70,
                height: 70,
                color: Colors.grey.shade300,
                child: const Icon(Icons.person),
              ),
            ),
          ),

          const SizedBox(width: 12),

          /// البيانات
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  doctor.name,
                  style: AppTextStyle.font14BlackSemiBold
                ),
                Text(
                  doctor.specialty,
                  style: AppTextStyle.font12GrayMedium
                ),
                Row(
                  children: [
                  
                    Text(
                      doctor.rating.toString(),
                      style: AppTextStyle.font12GrayMedium,
                    ),
                    horizontalSpace(4),
                      const Icon(Icons.star,
                        size: 18, color: Colors.amber),
                    horizontalSpace(3),
                    Text(
                      '(${doctor.reviewsCount} reviews)',
                      style: AppTextStyle.font12Grayregular,
                    ),
                  ],
                ),
                Text(
                  doctor.distance,
                  style:AppTextStyle.font12Grayregular
                ),
              ],
            ),
          ),

          /// زر Book
          ElevatedButton(
            onPressed: onBook,
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorsManeger.darkGreen,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding:
                  const EdgeInsets.symmetric(horizontal: 27, vertical: 6),
            ),
            child: Text('Book', style: AppTextStyle.font14WightMedium),
          ),
        ],
      ),
    );
  }
}
