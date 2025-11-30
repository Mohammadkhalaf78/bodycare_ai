import 'package:bodycare_ai/pages/auth_pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
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
        home:  WelcomeView(),
      ),
    );
  }
}