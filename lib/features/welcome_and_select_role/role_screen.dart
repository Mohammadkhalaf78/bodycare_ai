// lib/screens/select_role_screen.dart
import 'package:bodycare_ai/core/cubit/doctor_cubit.dart';
import 'package:bodycare_ai/core/cubit/user_cubit.dart';
import 'package:bodycare_ai/core/helpers/extensions.dart';
import 'package:bodycare_ai/core/network/api/dio_consumer.dart';
import 'package:bodycare_ai/core/routing/routes.dart';
import 'package:bodycare_ai/core/theming/colors.dart';
import 'package:bodycare_ai/core/theming/style.dart';
import 'package:bodycare_ai/core/widgets/app_text_button.dart';
import 'package:bodycare_ai/features/welcome_and_select_role/widgets/role_card.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectRoleScreen extends StatelessWidget {
  const SelectRoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManeger.mainBlue,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24.h),
              Row(
                children: [
                  Container(
                    width: 30.w,
                    height: 30.h,
                    decoration: const BoxDecoration(
                      color: ColorsManeger.primary,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.add, color: Colors.white),
                  ),
                  const SizedBox(width: 12),
                  Text('MediConnect', style: AppTextStyle.font18BlackBold),
                ],
              ),
              const SizedBox(height: 40),
              Text('Select Your Role', style: AppTextStyle.font32BlackBold),
              const SizedBox(height: 12),
              Text(
                'Please choose the option that describes you to customize your experience.',
                style: AppTextStyle.font16GrayRegular,
              ),
              const SizedBox(height: 32),
              Row(
                children: [
                  BlocProvider(
                    create: (context) => UserCubit(DioConsumer(dio: Dio())),
                    child: RoleCard(
                      title: 'Patient',
                      subtitle: 'I am seeking care',
                      icon: Icons.person,
                      isSelected: false, // just for UI sample
                      onTap: () {
                        context.read<UserCubit>().isLoggedIn()
                            ? context.pushNamed(Routes.mainNavigation)
                            : context.pushNamed(Routes.loginScreen);
                      },
                    ),
                  ),
                  BlocProvider(
                    create: (context) => DoctorCubit(DioConsumer(dio: Dio())),
                    child: RoleCard(
                      title: 'Doctor',
                      subtitle: 'I am a provider',
                      icon: Icons.medical_services_outlined,
                      isSelected: false,
                      onTap: () {
                        context.pushNamed(Routes.loginDoctorScreen);
                      },
                    ),
                  ),
                ],
              ),
              AppTextButton(
                onPressed: () {
                  context.pushNamed(Routes.mainNavigation);
                },

                backgroundColor: Colors.transparent,
                textStyle: AppTextStyle.font14GrayMedium,
                buttonText: 'Login as Admin',
              ),
              const Spacer(),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Need help? Login as Admin',
                    style: AppTextStyle.font14GrayMedium,
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
