import 'package:bodycare_ai/core/routing/app_routing.dart';
import 'package:bodycare_ai/features/body_care.dart';
import 'package:bodycare_ai/features/welcome_and_select_role/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(BodyCare(appRoute: AppRoute(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext   context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
       builder: (_ , child)=> GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home:  WelcomeScreen(),
      ),
    );
  }
}