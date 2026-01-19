import 'package:bodycare_ai/core/helpers/extensions.dart';
import 'package:bodycare_ai/core/helpers/spacing.dart';
import 'package:bodycare_ai/core/theming/colors.dart';
import 'package:bodycare_ai/core/theming/style.dart';
import 'package:bodycare_ai/core/widgets/app_text_button.dart';
import 'package:bodycare_ai/core/widgets/app_text_form_filed.dart';
import 'package:bodycare_ai/core/widgets/logo.dart';
import 'package:bodycare_ai/features/auth_petiant/widgets/app_phone_filed.dart';
import 'package:bodycare_ai/features/auth_petiant/widgets/birthday.dart';
import 'package:bodycare_ai/features/auth_petiant/widgets/gendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInPathientScreen extends StatelessWidget {
  const SignInPathientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManeger.wightColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Segmented control (statically showing Patient selected)
                Logo(),
                verticalSpace(22),

                Text(
                  'Create your account',
                  style: AppTextStyle.font32BlackBold,
                ),

                // Card
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: ColorsManeger.wightColor,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 22.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Full Name', style: AppTextStyle.font16BlackMedium),
                      const SizedBox(height: 8),
                      // Email input
                      AppTextFormFiled(
                        prefixIcon: Icon(Icons.person_2_outlined),
                        hintText: 'John Doe',
                        hintStyle: AppTextStyle.font14GreenRegular,
                      ),
                      const SizedBox(height: 14),

                      // Email label
                      Text('Email', style: AppTextStyle.font16BlackMedium),
                      const SizedBox(height: 8),
                      // Email input
                      AppTextFormFiled(
                        prefixIcon: Icon(Icons.email_outlined),
                        hintText: 'example@email.com',
                        hintStyle: AppTextStyle.font14GreenRegular,
                      ),
                      verticalSpace(14),

                      // phone label
                      Text(
                        'phone Number',
                        style: AppTextStyle.font16BlackMedium,
                      ),
                      verticalSpace(8),
                      // Email input
                      AppFormPhoneFiled(),
                      verticalSpace(14),

                      // Birthday label
                      Text('Birthday', style: AppTextStyle.font16BlackMedium),
                      verticalSpace(8),
                      Birthday(),

                      verticalSpace(14),

                      // Gender label
                      Text('Gender', style: AppTextStyle.font16BlackMedium),
                      verticalSpace(8),
                      // Email input
                      Gendar(),
                      verticalSpace(14),

                      // Password label
                      Text('Password', style: AppTextStyle.font16BlackMedium),
                      verticalSpace(8),
                      // password label
                      AppTextFormFiled(
                        prefixIcon: Icon(Icons.lock_outline),
                        hintText: 'Enter your password',
                        hintStyle: AppTextStyle.font14GreenRegular,
                        isObscureText: true,
                        suffixIcons: Icon(Icons.visibility_off_outlined),
                      ),

                      verticalSpace(14),

                      // Password label
                      Text(
                        'Confirm Password',
                        style: AppTextStyle.font16BlackMedium,
                      ),
                      verticalSpace(8),
                      // Password input
                      AppTextFormFiled(
                        hintText: 'Confirm your password',
                        isObscureText: true,
                        prefixIcon: Icon(Icons.lock_outline),
                        hintStyle: AppTextStyle.font14GreenRegular,
                      ),

                      verticalSpace(20),

                      // Sign Up button
                      AppTextButton(
                        textStyle: AppTextStyle.font16BlackBold,
                        onPressed: () {},
                        buttonText: 'Sign Up',
                      ),

                      verticalSpace(12),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Already have an account? ",
                            style: AppTextStyle.font12GrayMedium,
                          ),
                          TextButton(
                            onPressed: () {
                              context.pushNamed('/loginScreen');
                            },
                            child: Text(
                              'Log In',
                              style: AppTextStyle.font14GreenSemiBold,
                            ),
                          ),
                        ],
                      ),

                      Center(
                        child: Wrap(
                          children: [
                            Text(
                              'By signing up, you agree to our ',
                              style: AppTextStyle.font12Grayregular,
                            ),
                            Text(
                              'Terms of Service',
                              style: AppTextStyle.font12Grayregular.copyWith(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            Text(
                              ' and ',
                              style: AppTextStyle.font12Grayregular,
                            ),
                            Text(
                              'Privacy Policy',
                              style: AppTextStyle.font12Grayregular.copyWith(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ), // end card
              ],
            ),
          ),
        ),
      ),
    );
  }
}
