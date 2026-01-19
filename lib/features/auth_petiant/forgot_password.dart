import 'package:bodycare_ai/core/helpers/spacing.dart';
import 'package:bodycare_ai/core/theming/colors.dart';
import 'package:bodycare_ai/core/theming/style.dart';
import 'package:bodycare_ai/core/widgets/app_text_button.dart';
import 'package:bodycare_ai/core/widgets/app_text_form_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password', style: AppTextStyle.font18BlackBold),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(30),
              Text(
                'Enter the email address associated with your\naccount and we\'ll send you a link to reset your\npassword.',
                style: AppTextStyle.font14GreenRegular,
              ),

              verticalSpace(30),

              Text('Email eddress', style: AppTextStyle.font16BlackMedium),

              verticalSpace(10),

              AppTextFormFiled(
                hintText: 'Enter your email address',
                prefixIcon: Icon(
                  Icons.email_outlined,
                  color: ColorsManeger.lightGreen,
                ),
              ),

              Spacer(),

              AppTextButton(
                textStyle: AppTextStyle.font18WhiteBold,
                onPressed: () {},
                buttonText: 'Send Reset Link',
              ),

              verticalSpace(15),

              Center(
                child: Text(
                  'Need help? Contact Support',
                  style: AppTextStyle.font14GreenSemiBold.copyWith(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              verticalSpace(50),
            ],
          ),
        ),
      ),
    );
  }
}
