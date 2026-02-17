import 'package:bodycare_ai/core/theming/colors.dart';
import 'package:bodycare_ai/core/theming/style.dart';
import 'package:flutter/material.dart';

class DiagnosisReady extends StatelessWidget {
  const DiagnosisReady({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
      Text('Ai_generated result',style: AppTextStyle.font12Grayregular,),
      Container(
        margin: const EdgeInsets.only(left: 8),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: ColorsManeger.lightGreen,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          'Diagnosis Ready',
          style: AppTextStyle.font12Grayregular,
        ),
      )

      ],
    );
  }
}
