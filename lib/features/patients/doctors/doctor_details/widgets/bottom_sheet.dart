import 'package:bodycare_ai/core/theming/style.dart';
import 'package:bodycare_ai/core/widgets/app_text_button.dart';
import 'package:flutter/material.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: AppTextButton(
          textStyle: AppTextStyle.font14WightMedium,
          onPressed: () {},
          buttonText: 'Book Appointment',
        ),
      );
  }
}