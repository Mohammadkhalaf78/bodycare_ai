import 'package:bodycare_ai/core/theming/style.dart';
import 'package:flutter/material.dart';

class AppointmentDetailsScreen extends StatelessWidget {
  const AppointmentDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Appointment Details',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(height: 22),

            PersonalDatails(),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class PersonalDatails extends StatelessWidget {
  const PersonalDatails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Personal_Details(),
        SizedBox(height: 16),
        appointment_details(
          appointmentDate: 'Tuesday, Oct 26, 2024',
          appointmentTime: '10:00 AM',
          appointmentIcon: Icons.calendar_today,
        ),
        appointment_details(
          appointmentDate: 'Virtual Consultation',
          appointmentTime: '',
          appointmentIcon: Icons.video_call,
        ),
        appointment_details(
          appointmentDate: 'Lower Back Pain',
          appointmentTime: '',
          appointmentIcon: Icons.location_disabled_rounded,
        ),
        SizedBox(height: 32),
        Align(
          alignment: Alignment.centerLeft,
          child: Text('Patient Notes ', style: AppTextStyle.font18BlackBold),
        ),
        SizedBox(height: 8),
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Text(
            'The pain in my lower back has been persistent for the last two weeks, especially after sitting for long periods. Its a dull ache that sometimes radiates down my right leg. Over-the-counter pain relievers haven\'t been very effective.',
            style: AppTextStyle.font16GrayRegular,
          ),
        ),
      ],
    );
  }
}

class appointment_details extends StatelessWidget {
  const appointment_details({
    required this.appointmentDate,
    required this.appointmentTime,
    required this.appointmentIcon,
    super.key,
  });
  final String appointmentDate;
  final String appointmentTime;
  final IconData appointmentIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Color.fromARGB(54, 17, 212, 153),
            child: Icon(appointmentIcon, color: Colors.green),
          ),
          SizedBox(width: 16),
          Text(appointmentDate, style: AppTextStyle.font16BlackMedium),
          Spacer(),
          Text(appointmentTime, style: AppTextStyle.font14GrayMedium),
        ],
      ),
    );
  }
}

class Personal_Details extends StatelessWidget {
  const Personal_Details({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            'assets/photo/appointD.png',
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Alexandra Collins', style: AppTextStyle.font20BlackBold),
            const SizedBox(height: 4),
            Text('Session ID: #12345', style: AppTextStyle.font16GrayRegular),
          ],
        ),
      ],
    );
  }
}
