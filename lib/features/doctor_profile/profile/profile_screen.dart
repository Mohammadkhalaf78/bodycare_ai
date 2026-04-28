import 'package:bodycare_ai/core/helpers/extensions.dart';
import 'package:bodycare_ai/core/helpers/spacing.dart';
import 'package:bodycare_ai/core/routing/routes.dart';
import 'package:bodycare_ai/core/theming/colors.dart';
import 'package:bodycare_ai/core/theming/style.dart';
import 'package:bodycare_ai/core/widgets/app_text_button.dart';
import 'package:bodycare_ai/features/patients/widgets/sattings_button.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManeger.mainBlue,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorsManeger.mainBlue,
        title: Text('Profile', style: AppTextStyle.font25BlackBold),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/photo/Doctor Smith profile picture.png'),
              ),
              verticalSpace(20),
              Text('Dr. Mohamed Ali', style: AppTextStyle.font20BlackBold),
              Text('Cardiologist', style: AppTextStyle.font16GreenRegular),
              verticalSpace(20),
              SattingsButton(
                title: 'Personal Information',
                icon: Icons.person_outline,
                onTap: () {
                  // Handle Edit Profile tap
                },
              ),
              verticalSpace(15),
              SattingsButton(
                title: 'Security',
                icon: Icons.security_outlined,
                onTap: () {},
              ),
              verticalSpace(15),
              SattingsButton(
                title: 'help & support',
                icon: Icons.help_outline,
                onTap: () {},
              ),
              verticalSpace(40),

              AppTextButton(
                textStyle: AppTextStyle.font14RedSemiBold,
                onPressed: () {
                  context.pushReplacementNamed(Routes.selectRoleScreen);
                },
                buttonText: 'Logout',
                backgroundColor: ColorsManeger.mainBlue,
                side: BorderSide(color: Colors.red, width: 1.3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
