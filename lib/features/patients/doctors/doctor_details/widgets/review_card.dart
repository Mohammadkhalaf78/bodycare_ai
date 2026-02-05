import 'package:bodycare_ai/features/users/data/models/doctors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewCard extends StatelessWidget {
  final DoctorModelCopy doctor;
  const ReviewCard({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        // ignore: deprecated_member_use
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, 4))],
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(doctor.imageUrl),
            radius: 22,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctor.name.split(' ').first + (doctor.name.split(' ').length > 1 ? ' ' + doctor.name.split(' ').last[0] + '.' : ''),
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 4),
                Row(
                  children: List.generate(5, (i) {
                    return Icon(
                      i < doctor.rating.round() ? Icons.star : Icons.star_border,
                      size: 14,
                      color: Colors.orange.shade400,
                    );
                  }),
                ),
                const SizedBox(height: 6),
                Text(
                  '"${doctor.sampleReview.length > 60 ? doctor.sampleReview.substring(0, 60) + '...' : doctor.sampleReview}"',
                  style: const TextStyle(fontSize: 12, color: Colors.black54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
