import 'package:bodycare_ai/core/theming/colors.dart';
import 'package:bodycare_ai/core/theming/style.dart';
import 'package:flutter/material.dart';

class CaseDatailsScreen extends StatelessWidget {
  const CaseDatailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManeger.mainBlue,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorsManeger.mainBlue,
        title: Text('Case Details', style: AppTextStyle.font18BlackBold),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              PersonalDatails(),

              const SizedBox(height: 16),
              const Divider(color: Colors.black, thickness: 1),
              const SizedBox(height: 16),
              age_gender_widget(),
              SizedBox(height: 6),
              Divider(color: Colors.grey, thickness: 1),
              status_widget(),
              SizedBox(height: 16),
              pain_area()
          
            ],
          ),
        ),
      ),
    );
  }
}

class pain_area extends StatelessWidget {
  const pain_area({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text('Pain area', style: AppTextStyle.font18BlackBold,)),
          const SizedBox(height: 8),
          Image.asset(
            'assets/photo/pain_area.png',
            width: 100,
            height: 200,
            fit: BoxFit.cover,
          ),
          Text('left shoulder', style: AppTextStyle.font18BlackBold),
          const SizedBox(height: 8),
          Text('patient report sharp, radiating pain', style: AppTextStyle.font14GrayMedium),
          const SizedBox(height: 16),
    
    
        
        ],
      ),
    );
  }
}

class status_widget extends StatelessWidget {
  const status_widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Text('Date Submitted', style: AppTextStyle.font14GrayMedium),
            const SizedBox(height: 8),
            Text('24 Oct, 2023', style: AppTextStyle.font16BlackBold),
          ],
        ),
        Column(
          children: [
            Text('Status', style: AppTextStyle.font14GrayMedium),
            const SizedBox(height: 8),
            Text('Pending Review', style: AppTextStyle.font16BlackBold),
          ],
        ),
      ],
    );
  }
}

class age_gender_widget extends StatelessWidget {
  const age_gender_widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Text('age', style: AppTextStyle.font14GrayMedium),
            const SizedBox(height: 8),
            Text('30', style: AppTextStyle.font16BlackBold),
          ],
        ),
        Column(
          children: [
            Text('Gender', style: AppTextStyle.font14GrayMedium),
            const SizedBox(height: 8),
            Text('female', style: AppTextStyle.font16BlackBold),
          ],
        ),
      ],
    );
  }
}

class PersonalDatails extends StatelessWidget {
  const PersonalDatails({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            'assets/photo/Image.png',
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Patient: John Doe', style: AppTextStyle.font18BlackBold),
            const SizedBox(height: 8),
            Text('Session ID: #12345', style: AppTextStyle.font14GreenRegular),
          ],
        ),
      ],
    );
  }
}
