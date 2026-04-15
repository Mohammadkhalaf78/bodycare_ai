import 'package:bodycare_ai/core/cubit/doctor_cubit.dart';
import 'package:bodycare_ai/core/cubit/user_cubit.dart';
import 'package:bodycare_ai/core/cubit/user_state.dart';
import 'package:bodycare_ai/core/helpers/extensions.dart';
import 'package:bodycare_ai/core/helpers/spacing.dart';
import 'package:bodycare_ai/core/network/api/dio_consumer.dart';
import 'package:bodycare_ai/core/routing/routes.dart';
import 'package:bodycare_ai/core/theming/colors.dart';
import 'package:bodycare_ai/core/theming/style.dart';
import 'package:bodycare_ai/core/widgets/app_text_button.dart';
import 'package:bodycare_ai/core/widgets/app_text_form_filed.dart';
import 'package:bodycare_ai/core/widgets/logo.dart';
import 'package:bodycare_ai/features/auth/sign_up_doctor/dropdownlabelwidget.dart';
import 'package:bodycare_ai/features/auth/widgets/app_phone_filed.dart';
import 'package:bodycare_ai/features/auth/widgets/birthday.dart';
import 'package:bodycare_ai/features/auth/widgets/gendar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpDoctorPage extends StatelessWidget {
  const SignUpDoctorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DoctorCubit(DioConsumer(dio: Dio())),
      child: BlocConsumer<DoctorCubit, DoctorState>(
        listener: (context, state) {},
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
                        'Create your professional profile',
                        style: AppTextStyle.font25BlackBold,
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

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Full Name',
                              style: AppTextStyle.font16BlackMedium,
                            ),
                            verticalSpace(8),
                            // Email input
                            AppTextFormFiled(
                              controller: context
                                  .read<DoctorCubit>()
                                  .doctorRegistraionName,
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
                              controller: context
                                  .read<DoctorCubit>()
                                  .doctorRegistraionEmail,
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

                            AppFormPhoneFiled(
                              controller: context
                                  .read<DoctorCubit>()
                                  .doctorRegistraionPhone,
                            ),
                            verticalSpace(14),

                            // Specialty label
                            Text(
                              'Specialty',
                              style: AppTextStyle.font16BlackMedium,
                            ),
                            verticalSpace(8),
                            Dropdownlabelwidget(),
                            verticalSpace(14),

                            // Password label
                            Text(
                              'Password',
                              style: AppTextStyle.font16BlackMedium,
                            ),
                            verticalSpace(8),
                            // password label
                            AppTextFormFiled(
                              controller: context
                                  .read<DoctorCubit>()
                                  .doctorRegistraionPassword,
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
                            context.read<DoctorCubit>().state is SignUpLoading
                                ? Center(
                                    child: CircularProgressIndicator(
                                      color: ColorsManeger.darkGreen,
                                    ),
                                  )
                                : AppTextButton(
                                    textStyle: AppTextStyle.font16BlackBold,
                                    onPressed: () {
                                      context.pushNamed(
                                        Routes.registrationReceivedPage,
                                      );
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
                                    context.pushNamed(Routes.loginDoctorScreen);
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
                      ), // end card
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
