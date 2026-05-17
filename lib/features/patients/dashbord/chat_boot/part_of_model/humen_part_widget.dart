// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Humen_Part extends StatelessWidget {
  const Humen_Part({super.key,required this.bodyPart});
  final String bodyPart;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Image.asset(
        '${getImagePath('Head')}', // Replace 'Head' with the actual body part you want to display
        width: 150,
        height: 150,
      ),
    );
  }
}

String? getImagePath(String bodyPart) {
  switch (bodyPart) {
    case 'Head':
      return 'assets/photo/—Pngtree—detailed human head anatomy with_20553138.png';
    case 'Chest':
      return 'assets/photo/body.png';
    case 'Abdomen':
      return 'assets/photo/—Pngtree—detailed human head anatomy with_20553138.png';
    case 'Back':
      return 'assets/photo/—Pngtree—detailed human head anatomy with_20553138.png';
    case 'Pelvis':
      return 'assets/photo/—Pngtree—detailed human head anatomy with_20553138.png';
    case 'Hip':
      return 'assets/photo/—Pngtree—detailed human head anatomy with_20553138.png';
    case 'Thigh':
      return 'assets/photo/—Pngtree—detailed human head anatomy with_20553138.png';
    case 'Knee':
      return 'assets/photo/—Pngtree—detailed human head anatomy with_20553138.png';
    case 'Leg':
      return 'assets/photo/—Pngtree—detailed human head anatomy with_20553138.png';
    case 'Ankle':
      return 'assets/photo/—Pngtree—detailed human head anatomy with_20553138.png';
    case 'Foot':
      return 'assets/photo/—Pngtree—detailed human head anatomy with_20553138.png';
  }
  return null;
}
