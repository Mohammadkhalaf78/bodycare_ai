import 'package:bodycare_ai/costanses/colors.dart';
import 'package:bodycare_ai/pages/dashboard_page.dart';
import 'package:bodycare_ai/pages/sign_up_page.dart';
import 'package:bodycare_ai/widgate/button_widgate.dart';
import 'package:bodycare_ai/widgate/container_widgate.dart';
import 'package:bodycare_ai/widgate/texfiled_widgate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final colors = constColors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 55.w,
                height: 50.h,
                decoration: BoxDecoration(
                  color: colors.primaryColor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.show_chart,
                  color: Colors.white,
                  size: 34,
                ),
              ),

              const SizedBox(height: 12),

              Text(
                'Health Diagnostic Assistant',
                style: TextStyle(
                  fontSize: 10.sp,
                  color: colors.textColor, // يمكنك تغيير اللون
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 4),

              Text(
                'Your personal health companion',
                style: TextStyle(fontSize: 10.sp, color: colors.secondaryColor),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.w),
              ContainerWidgate(
                childrens: [
                  Text(
                    'Welcome Back',
                    style: TextStyle(fontSize: 12.sp, color: colors.textColor),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Email',
                    style: TextStyle(fontSize: 11.sp, color: colors.textColor),
                  ),

                  SizedBox(height: 8),
                  SimpleTextField(
                    hint: 'Email Address',
                    icon: Icons.email_outlined,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'password',
                    style: TextStyle(fontSize: 11.sp, color: colors.textColor),
                  ),
                  SimpleTextField(hint: 'password', icon: Icons.lock_outline),
                  SizedBox(height: 22.h),
                  ButtonWidgate(
                    text: 'Login',
                    onPressed: () {
                      Get.to(DashboardPage());
                    },
                  ),
                  SizedBox(height: 16.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Do not have an account?',
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: colors.textColor,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: TextButton(
                          onPressed: () {
                            Get.to(SignUpPage());
                          },
                          child: Text(
                            ' Sign Up',
                            style: TextStyle(
                              fontSize: 11.sp,
                              color: colors.secondaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
