// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Humen_Part extends StatelessWidget {
  const Humen_Part({super.key, required this.bodyPart, required this.h, required this.w});
  final String bodyPart;
  final double h;
  final double w;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Image.asset(
        '${getImagePath(bodyPart)}', // Replace 'Head' with the actual body part you want to display
        width: w,
        height: h,
      ),
    );
  }
}

String? getImagePath(String bodyPart) {
  switch (bodyPart) {
    case 'Head':
      return 'assets/photo/—Pngtree—detailed human head anatomy with_20553138.png';
    case 'Arm.r':
      return 'assets/photo/body_parts/Arm.png';
    case 'chest.r':
      return 'assets/photo/body_parts/chest.png';
    case 'chest.l':
      return 'assets/photo/body_parts/chest.png';
    case 'Arm.l':
      return 'assets/photo/body_parts/Arm.png';
    case 'Thigh.r':
      return 'assets/photo/body_parts/Arm.png';
    case 'Thigh':
      return 'assets/photo/body_parts/Thigh.png';
    case 'Knee':
      return 'assets/photo/body_parts/Knee.png';
    case 'Leg':
      return 'assets/photo/body_parts/Leg.png';
    case 'Ankle':
      return 'assets/photo/—Pngtree—detailed human head anatomy with_20553138.png';
    case 'Foot':
      return 'assets/photo/—Pngtree—detailed human head anatomy with_20553138.png';
  }
  return null;
}
