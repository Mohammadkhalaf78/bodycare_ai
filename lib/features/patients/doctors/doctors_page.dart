import 'package:bodycare_ai/core/helpers/extensions.dart';
import 'package:bodycare_ai/core/theming/colors.dart';
import 'package:bodycare_ai/features/patients/widgets/doctor_card.dart';
import 'package:bodycare_ai/features/users/data/data_story/doctor_data.dart';
import 'package:flutter/material.dart';

class DoctorsPage extends StatelessWidget {
  const DoctorsPage({super.key});

  @override
  Widget build(BuildContext context) {
  

    return Scaffold(
      backgroundColor: ColorsManeger.mainBlue,
      appBar: AppBar(
        title: const Text('Doctors'),
        backgroundColor: ColorsManeger.wightColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: doctorsData.length,
          itemBuilder: (context,index){
          return DoctorCard(doctor: doctorsData[index],onBook: () {
            context.pushNamed('/DoctorProfile', arguments: doctorsData[index]);
          },);
        })
      ),
    );
  }
}
