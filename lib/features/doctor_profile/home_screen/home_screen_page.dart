import 'package:bodycare_ai/core/theming/style.dart';
import 'package:flutter/material.dart';

class HomeScreenDoctorPage extends StatelessWidget {
  const HomeScreenDoctorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Good Morning,', style: AppTextStyle.font16GreenRegular),
            Text('Dr. Mohamed', style: AppTextStyle.font25BlackBold),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: CircleAvatar(
              radius: 28,
              backgroundImage: AssetImage('assets/photo/smaling_avatar.jpg'),
            ),
          ),
        ],
      ),
      body: Center(child: Text('Home Screen')),
    );
  }
}
