import 'package:bodycare_ai/core/helpers/extensions.dart';
import 'package:bodycare_ai/core/helpers/spacing.dart';
import 'package:bodycare_ai/core/theming/colors.dart';
import 'package:bodycare_ai/core/theming/style.dart';
import 'package:bodycare_ai/core/widgets/app_text_button.dart';
import 'package:bodycare_ai/features/patients/widgets/sattings_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManeger.mainBlue,
      appBar: AppBar(title: Text('Profile Page')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/photo/smaling_avatar.jpg'),
              ),
              verticalSpace(20),
              Text('Mohamed', style: AppTextStyle.font18BlackBold),
              verticalSpace(2),
              Text('mohae@gmail.com', style: AppTextStyle.font12Grayregular),
              verticalSpace(20),
              SattingsButton(
                title: 'Edit Profile',
                icon: Icons.person_outline,
                onTap: () {
                  // Handle Edit Profile tap
                },
              ),
              verticalSpace(15),
              SattingsButton(
                title: 'Saved Sessions',
                icon: Icons.bookmark_border,
                onTap: () {
                  // Handle Edit Profile tap
                },
              ),
              verticalSpace(40),
              ElevatedButton(
                onPressed: () {
                  context.pushReplacementNamed('/loginScreen');
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsManeger.mainBlue,
                  padding: EdgeInsets.symmetric(
                    horizontal: 140.w,
                    vertical: 14.h,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                ),
                child: Text('Logout', style: AppTextStyle.font14RedSemiBold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
