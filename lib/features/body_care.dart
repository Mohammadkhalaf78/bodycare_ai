import 'package:bodycare_ai/core/routing/app_routing.dart';
import 'package:bodycare_ai/core/routing/routes.dart';
import 'package:bodycare_ai/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BodyCare extends StatelessWidget {
  const BodyCare({super.key, required this.appRoute});

  final AppRoute appRoute;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'bodycare ai',
          theme: ThemeData(
            primaryColor: ColorsManeger.mainBlue,
            scaffoldBackgroundColor: Colors.white,
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.welcomeScreen,

          onGenerateRoute: appRoute.generateRoute,
        );
      },
    );
  }
}
