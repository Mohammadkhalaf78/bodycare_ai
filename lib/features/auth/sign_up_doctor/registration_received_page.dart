import 'package:bodycare_ai/core/helpers/spacing.dart';
import 'package:bodycare_ai/core/routing/routes.dart';
import 'package:bodycare_ai/core/theming/colors.dart';
import 'package:bodycare_ai/core/theming/style.dart';
import 'package:bodycare_ai/core/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegistrationReceivedPage extends StatelessWidget {
  const RegistrationReceivedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 100,
          left: 20,
          right: 20,
          bottom: 30,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  height: 122,
                  width: 122,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(51, 76, 175, 79),
                    borderRadius: BorderRadius.circular(77),
                  ),
                  child: Icon(
                    Icons.check_circle,
                    color: ColorsManeger.darkGreen,
                    size: 65,
                  ),
                ),
                verticalSpace(20),
                Text(
                  'Registration Received',
                  style: AppTextStyle.font32BlackBold,
                ),
                verticalSpace(10),
                Text(
                  'Your registration has been received and is currently being reviewed by our team. We will notify you via email once the review process is complete.',
                  style: AppTextStyle.font16GrayRegular,
                  textAlign: TextAlign.center,
                ),
              ],
            ),

            AppTextButton(
              textStyle: AppTextStyle.font18WhiteBold,
              onPressed: () {
                context.pushNamed( Routes.loginDoctorScreen);
              },
              buttonText: 'Back to Home',
            ),
          ],
        ),
      ),
    );
  }
}
