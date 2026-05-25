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
import 'package:bodycare_ai/features/auth/widgets/app_phone_filed.dart';
import 'package:bodycare_ai/features/auth/widgets/birthday.dart';
import 'package:bodycare_ai/features/auth/widgets/gendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpPathientScreen extends StatelessWidget {
  const SignUpPathientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          context.pushNamed('/loginScreen');
        } else if (state is SignUpFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMessage),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
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
                      child: Form(
                        key: context.read<UserCubit>().signUpFormKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Full Name',
                              style: AppTextStyle.font16BlackMedium,
                            ),
                            const SizedBox(height: 8),
                            // Email input
                            AppTextFormFiled(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your name';
                                } else if (value.length < 3) {
                                  return 'Name must be at least 3 characters';
                                }
                                return null;
                              },
                              controller: context.read<UserCubit>().signUpName,
                              prefixIcon: Icon(Icons.person_2_outlined),
                              hintText: 'John Doe',
                              hintStyle: AppTextStyle.font14GreenRegular,
                            ),
                            const SizedBox(height: 14),

                            // Email label
                            Text(
                              'Email',
                              style: AppTextStyle.font16BlackMedium,
                            ),
                            const SizedBox(height: 8),
                            // Email input
                            AppTextFormFiled(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                } else if (!RegExp(
                                  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                                ).hasMatch(value)) {
                                  return 'Please enter a valid email';
                                }
                                return null;
                              },
                              controller: context.read<UserCubit>().signUpEmail,
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
                            AppFormPhoneFiled(
                              validator: (value) {
                                if (value == null || value.nsn.isEmpty) {
                                  return 'Please enter your phone number';
                                } else if (!RegExp(
                                  r'^\d{10,15}$',
                                ).hasMatch(value.nsn)) {
                                  return 'Please enter 10 to 15 digits for the phone number';
                                }
                                return null;
                              },
                              controller: context.read<UserCubit>().signUpPhone,
                            ),
                            verticalSpace(14),

                            // Birthday label
                            Text(
                              'Birthday',
                              style: AppTextStyle.font16BlackMedium,
                            ),
                            verticalSpace(8),
                            Birthday(),

                            verticalSpace(14),

                            // Gender label
                            Text(
                              'Gender',
                              style: AppTextStyle.font16BlackMedium,
                            ),
                            verticalSpace(8),
                            // Email input
                            Gendar(),
                            verticalSpace(14),

                            // Password label
                            Text(
                              'Password',
                              style: AppTextStyle.font16BlackMedium,
                            ),
                            verticalSpace(8),
                            // password label
                            AppTextFormFiled(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                } else if (value.length < 6) {
                                  return 'Password must be at least 6 characters';
                                }
                                return null;
                              },
                              controller: context
                                  .read<UserCubit>()
                                  .signUpPassword,
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
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please confirm your password';
                                } else if (value !=
                                    context
                                        .read<UserCubit>()
                                        .signUpPassword
                                        .text) {
                                  return 'Passwords do not match';
                                }
                                return null;
                              },
                            ),

                            verticalSpace(20),

                            // Sign Up button
                            context.read<UserCubit>().state is SignUpLoading
                                ? Center(
                                    child: CircularProgressIndicator(
                                      color: ColorsManeger.darkGreen,
                                    ),
                                  )
                                : AppTextButton(
                                    textStyle: AppTextStyle.font16BlackBold,
                                    onPressed: () {
                                      if (context
                                          .read<UserCubit>()
                                          .signUpFormKey
                                          .currentState!
                                          .validate()) {
                                        context.read<UserCubit>().signUp();
                                      }
                                    },
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
                                    context.pushNamed(Routes.selectRoleScreen);
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
                                    style: AppTextStyle.font12Grayregular
                                        .copyWith(
                                          decoration: TextDecoration.underline,
                                        ),
                                  ),
                                  Text(
                                    ' and ',
                                    style: AppTextStyle.font12Grayregular,
                                  ),
                                  Text(
                                    'Privacy Policy',
                                    style: AppTextStyle.font12Grayregular
                                        .copyWith(
                                          decoration: TextDecoration.underline,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ), // end card
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
