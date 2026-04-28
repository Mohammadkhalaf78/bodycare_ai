import 'package:bodycare_ai/core/cubit/user_cubit.dart';
import 'package:bodycare_ai/core/cubit/user_state.dart';
import 'package:bodycare_ai/core/helpers/extensions.dart';
import 'package:bodycare_ai/core/helpers/spacing.dart';
import 'package:bodycare_ai/core/routing/routes.dart';
import 'package:bodycare_ai/core/theming/colors.dart';
import 'package:bodycare_ai/core/theming/style.dart';
import 'package:bodycare_ai/core/widgets/app_text_button.dart';
import 'package:bodycare_ai/core/widgets/app_text_form_filed.dart';
import 'package:bodycare_ai/core/widgets/logo.dart';
import 'package:bodycare_ai/features/auth/login_doctor/cubit/login_doctor_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginDoctorScreen extends StatelessWidget {
  const LoginDoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginDoctorCubit, LoginDoctorState>(
      listener: (context, state) {
        if (state is LoginDoctorLoading) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Logging in...')));
        } else if (state is LoginDoctorSuccess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Login successful!')));
          context.pushNamed(Routes.drMainNavigation);
        } else if (state is LoginDoctorError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Login failed: ${state.errorMessage}')),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ColorsManeger.mainBlue,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
              child: ListView(
                children: [
                  verticalSpace(12),
                  // Title
                  Text(
                    'BodyCare AI',
                    style: AppTextStyle.font18BlackBold,
                    textAlign: TextAlign.center,
                  ),
                  verticalSpace(
                    22,
                  ), // Segmented control (statically showing Patient selected)
                  Logo(),
                  verticalSpace(22),

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
                        // Welcome Back
                        Text(
                          'Welcome Back',
                          style: AppTextStyle.font32BlackBold,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          "Sign in to your doctor account.",
                          style: AppTextStyle.font16GrayRegular,
                        ),
                        const SizedBox(height: 18),

                        // Email label
                        Text('Email', style: AppTextStyle.font16BlackMedium),
                        const SizedBox(height: 8),
                        // Email input
                        AppTextFormFiled(
                          hintText: 'Enter your email',
                          controller: context
                              .read<LoginDoctorCubit>()
                              .doctorLoginEmail,
                        ),
                        const SizedBox(height: 14),

                        // Password label
                        Text('Password', style: AppTextStyle.font16BlackMedium),
                        const SizedBox(height: 8),
                        // Password input
                        AppTextFormFiled(
                          hintText: 'Enter your password',
                          isObscureText: true,
                          controller: context
                              .read<LoginDoctorCubit>()
                              .doctorLoginPassword,
                        ),
                        const SizedBox(height: 8),
                        // Forgot password (aligned right)
                        forget_password_widget(),

                        verticalSpace(12),

                        // Sign In button
                        state is LoginDoctorLoading
                            ? Center(
                                child: CircularProgressIndicator(
                                  color: ColorsManeger.mainBlue,
                                ),
                              )
                            : AppTextButton(
                                textStyle: AppTextStyle.font16GrayRegular,
                                onPressed: () {
                                  context.read<LoginDoctorCubit>().login();
                                },
                                buttonText: 'Sign in ',
                              ),
                        verticalSpace(18),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Don't have an account?",
                              style: AppTextStyle.font14GrayMedium,
                            ),
                            TextButton(
                              onPressed: () {
                                context.pushNamed(Routes.signUpDoctorPage);
                              },
                              child: Text(
                                'Sign Up',
                                style: AppTextStyle.font14DarkGreenSemiBold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ), // end card
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class forget_password_widget extends StatelessWidget {
  const forget_password_widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          minimumSize: const Size(0, 0),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: Text(
          'Forgot Password?',
          style: AppTextStyle.font14DarkGreenSemiBold,
        ),
      ),
    );
  }
}
