import 'package:bodycare_ai/costanses/colors.dart';
import 'package:bodycare_ai/pages/login_page.dart';
import 'package:bodycare_ai/widgate/button_widgate.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({super.key});
  final colors = constColors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.backgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  color: colors.primaryColor,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.show_chart,
                  color: Colors.white,
                  size: 50,
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                'Welcome to BodyCare AI',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black, // يمكنك تغيير اللون
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 15),

              Text(
                'Your intelligent health triage assistant that helps you understand your symptoms and find the right care.',
                style: TextStyle(fontSize: 12, color: Color(0xFF4285F4)),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 38),

              ButtonWidgate(
                text: 'Get Started',
                onPressed: () {
                  Get.off(LoginPage());
                },
              ),
              const SizedBox(height: 20),

              Text(
                'By continuing, you acknowledge this is a triage tool, not a medical diagnosis.',
                style: TextStyle(
                  fontSize: 14,
                  color: colors.secondaryColor, // لون رمادي فاتح
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
