import 'package:bodycare_ai/core/theming/style.dart';
import 'package:bodycare_ai/core/widgets/app_text_button.dart';
import 'package:bodycare_ai/features/patients/dashbord/test_button/cubit/test_button_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestButton extends StatelessWidget {
  const TestButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextButton(
      textStyle: AppTextStyle.font12Grayregular,
      onPressed: () {
        context.read<TestButtonCubit>().sendmessage();
      },
      buttonText: 'Test Button',
    );
  }
}
