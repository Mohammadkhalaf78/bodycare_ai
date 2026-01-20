import 'package:bodycare_ai/core/helpers/spacing.dart';
import 'package:bodycare_ai/core/theming/colors.dart';
import 'package:bodycare_ai/core/theming/style.dart';
import 'package:bodycare_ai/core/widgets/app_text_button.dart';
import 'package:bodycare_ai/features/patients/doctors/widgets/doctor_container.dart';
import 'package:bodycare_ai/features/users/data/models/doctor_model.dart';
import 'package:flutter/material.dart';

class DoctorProfile extends StatelessWidget {
  const DoctorProfile({super.key, required this.doctorDatails});

  final DoctorModel doctorDatails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManeger.mainBlue,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorsManeger.darkGreen,
        title: Text('Doctor Profile', style: AppTextStyle.font16whitemedium),
      ),
      body: Column(
        children: [
          DoctorContainer(
            urs: doctorDatails.imageUrl,
            name: doctorDatails.name,
            specialty: doctorDatails.specialty,
            rating: doctorDatails.rating,
            reviewsCount: doctorDatails.reviewsCount,
          ),
          Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              children: [
                AppTextButton(
                  textStyle: AppTextStyle.font14BlackSemiBold,
                  onPressed: () {},
                  buttonText: 'Book Appointment',
                  backgroundColor: ColorsManeger.darkGreen,
                ),
                verticalSpace(16),
                AppTextButton(
                  textStyle: AppTextStyle.font14BlackSemiBold,
                  onPressed: () {},
                  buttonText: 'Massege Doctor',
                  backgroundColor: ColorsManeger.mainBlue,
                  side: BorderSide(color: ColorsManeger.darkGreen, width: 1.1),
                ),
                verticalSpace(16),
                AppTextButton(
                  textStyle: AppTextStyle.font14BlackSemiBold,
                  onPressed: () {},
                  buttonText: 'call clinic',
                  backgroundColor: ColorsManeger.mainBlue,
                  side: BorderSide(color: ColorsManeger.darkGreen, width: 1.1),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
