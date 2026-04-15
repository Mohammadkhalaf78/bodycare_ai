import 'package:bodycare_ai/core/theming/style.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Column(
          children: [
            Text('Good Morning',style: AppTextStyle.font12GreenRegular,),
            Text('Dr Mohamed',style: AppTextStyle.font16BlackBold,),
          ],
        ),
      );
  }
}