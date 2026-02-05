// import 'package:bodycare_ai/costanses/colors.dart';
// import 'package:bodycare_ai/pages/login_page.dart';
// import 'package:bodycare_ai/widgate/button_widgate.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';

import 'package:bodycare_ai/core/helpers/extensions.dart';
import 'package:bodycare_ai/core/routing/routes.dart';
import 'package:bodycare_ai/core/theming/colors.dart';
import 'package:bodycare_ai/core/theming/style.dart';
import 'package:bodycare_ai/core/widgets/app_text_button.dart';
import 'package:bodycare_ai/core/widgets/logo.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),

              // Logo
              Logo(),
              const SizedBox(height: 30),

              // Title
              Text(
                "Welcome to BodyCare AI",
                textAlign: TextAlign.center,
                style: AppTextStyle.font32BlackBold,
              ),

              const SizedBox(height: 16),

              // Subtitle
              Text(
                "Your personal guide to understanding localized pain, connecting with specialists, and managing your family's health.",
                textAlign: TextAlign.center,
                style: AppTextStyle.font16GrayRegular,
              ),

              const SizedBox(height: 200),

              // Button
              AppTextButton(
                backgroundColor: ColorsManeger.darkGreen,
                textStyle: AppTextStyle.font18WhiteBold,
                onPressed: () {
                  context.pushNamed(Routes.selectRoleScreen);
                },
                buttonText: "Get Started",
              ),
              // SizedBox(
              //   width: double.infinity,
              //   height: 60,
              //   child: ElevatedButton(
              //     style: ElevatedButton.styleFrom(
              //       backgroundColor: const Color(0xFF21B383),
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(18),
              //       ),
              //       elevation: 3,
              //     ),
              //     onPressed: () {
              //       context.pushNamed(Routes.selectRoleScreen);
              //     },
              //     child: const Text(
              //       "Get Started",
              //       style: TextStyle(
              //         fontSize: 20,
              //         color: Colors.white,
              //         fontWeight: FontWeight.w600,
              //       ),
              //     ),
              //   ),
              // ),

              // const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

