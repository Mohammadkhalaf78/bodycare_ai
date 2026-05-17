import 'package:bodycare_ai/core/cache/cache_helper.dart';
import 'package:bodycare_ai/core/helpers/extensions.dart';
import 'package:bodycare_ai/core/helpers/spacing.dart';
import 'package:bodycare_ai/core/network/api/end_point.dart';
import 'package:bodycare_ai/core/routing/routes.dart';
import 'package:bodycare_ai/core/theming/colors.dart';
import 'package:bodycare_ai/core/theming/style.dart';
import 'package:bodycare_ai/core/widgets/app_text_button.dart';
import 'package:bodycare_ai/features/patients/widgets/sattings_button.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManeger.mainBlue,
      appBar: AppBar(title: Text('Profile Page')),
      body:
       Center(
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
              Text(
                // '${CacheHelper().getData(key: ApiKey.name)}',
                '${CacheHelper().getData(key: ApiKey.name) ?? 'User'}',
                style: AppTextStyle.font18BlackBold,
              ),
              verticalSpace(2),
              Text('${CacheHelper().getData(key: ApiKey.email) ?? 'user@example.com'}', style: AppTextStyle.font12Grayregular),
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
                  context.pushNamed(Routes.historyPage);
                },
              ),
              verticalSpace(15),
              SattingsButton(
                title: 'Settings',
                icon: Icons.settings_outlined,
                onTap: () {
                },
              ),
              verticalSpace(40),

              AppTextButton(
                textStyle: AppTextStyle.font14RedSemiBold,
                onPressed: () {
                  context.pushReplacementNamed(Routes.loginScreen);
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
