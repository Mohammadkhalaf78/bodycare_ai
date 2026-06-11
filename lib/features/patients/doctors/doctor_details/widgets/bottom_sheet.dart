import 'package:bodycare_ai/core/helpers/extensions.dart';
import 'package:bodycare_ai/core/routing/routes.dart';
import 'package:bodycare_ai/core/theming/style.dart';
import 'package:bodycare_ai/core/widgets/app_text_button.dart';
import 'package:bodycare_ai/features/users/data/models/doctors_model.dart';
import 'package:flutter/material.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({super.key, required this.doctor});
  final FormattedDoctor doctor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: AppTextButton(
        textStyle: AppTextStyle.font14WightMedium,
        onPressed: () {
          context.pushNamed(Routes.SelectTimeSlotScreen, arguments: doctor);
        },
        buttonText: 'Book Appointment',
      ),
    );
  }
}
