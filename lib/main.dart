import 'package:bodycare_ai/core/cache/cache_helper.dart';
import 'package:bodycare_ai/core/cubit/doctor_cubit.dart';
import 'package:bodycare_ai/core/cubit/user_cubit.dart';
import 'package:bodycare_ai/core/network/api/dio_consumer.dart';
import 'package:bodycare_ai/core/network/helpers.dart/dio_helper.dart';
import 'package:bodycare_ai/core/routing/app_routing.dart';
import 'package:bodycare_ai/features/body_care.dart';
import 'package:bodycare_ai/features/welcome_and_select_role/welcome_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper().init();

  await DioHelper.init();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DoctorCubit(DioConsumer(dio: Dio())),
        ),
        BlocProvider(
          create: (context) => UserCubit(DioConsumer(dio: Dio())),
        ),
      ],
      child: BodyCare(appRoute: AppRoute()),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      builder: (_, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: WelcomeScreen(),
      ),
    );
  }
}
