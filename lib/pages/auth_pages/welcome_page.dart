// import 'package:bodycare_ai/costanses/colors.dart';
// import 'package:bodycare_ai/pages/login_page.dart';
// import 'package:bodycare_ai/widgate/button_widgate.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';

import 'package:bodycare_ai/pages/auth_pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

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
              Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  color: const Color(0xFFD5F1E9),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  Icons.health_and_safety,
                  color: Color(0xFF1BA97C),
                  size: 40,
                ),
              ),

              const SizedBox(height: 30),

              // Title
              const Text(
                "Welcome to BodyCare AI",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 16),

              // Subtitle
              const Text(
                "Your personal guide to understanding localized pain, connecting with specialists, and managing your family's health.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  height: 1.4,
                  fontSize: 16,
                  color: Color(0xFF6D6D6D),
                ),
              ),

              const SizedBox(height: 200),

              // Button
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF21B383),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    elevation: 3,
                  ),
                  onPressed: () {
                    Get.to(LoginPage());
                  },
                  child: const Text(
                    "Get Started",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

// class WelcomePage extends StatelessWidget {
//   WelcomePage({super.key});
//   final colors = constColors();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: colors.backgroundColor,
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(30.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               Container(
//                 width: 90,
//                 height: 90,
//                 decoration: BoxDecoration(
//                   color: colors.primaryColor,
//                   shape: BoxShape.circle,
//                 ),
//                 child: const Icon(
//                   Icons.show_chart,
//                   color: Colors.white,
//                   size: 50,
//                 ),
//               ),

//               const SizedBox(height: 30),

//               const Text(
//                 'Welcome to BodyCare AI',
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: Colors.black, // يمكنك تغيير اللون
//                 ),
//                 textAlign: TextAlign.center,
//               ),

//               const SizedBox(height: 15),

//               Text(
//                 'Your intelligent health triage assistant that helps you understand your symptoms and find the right care.',
//                 style: TextStyle(fontSize: 12, color: Color(0xFF4285F4)),
//                 textAlign: TextAlign.center,
//               ),

//               const SizedBox(height: 38),

//               ButtonWidgate(
//                 text: 'Get Started',
//                 onPressed: () {
//                   Get.off(LoginPage());
//                 },
//               ),
//               const SizedBox(height: 20),

//               Text(
//                 'By continuing, you acknowledge this is a triage tool, not a medical diagnosis.',
//                 style: TextStyle(
//                   fontSize: 14,
//                   color: colors.secondaryColor, // لون رمادي فاتح
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
