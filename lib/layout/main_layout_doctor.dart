import 'package:bodycare_ai/core/cubit/nav_cubit.dart';
import 'package:bodycare_ai/features/doctor_profile/appointment/appointments_screen.dart';
import 'package:bodycare_ai/features/doctor_profile/casess/cases_screen.dart';
import 'package:bodycare_ai/features/doctor_profile/home_screen/home_screen_page.dart';
import 'package:bodycare_ai/features/doctor_profile/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainLayoutDoctor extends StatelessWidget {
  const MainLayoutDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DrtNavCubit(),
      child: const MainView(),
    );
  }
}

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {

    // 👇 كل الصفحات
    final pages = [
      HomeScreenDoctorPage(),
      CasesScreen(),
      AppointmentsScreen(),
      ProfileScreen(),
    ];

    return BlocBuilder<DrtNavCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(

          /// 👇 الصفحة الحالية
          body: pages[currentIndex],

          /// 👇 البار اللي تحت
          bottomNavigationBar: BottomNavigationBar(
            fixedColor: Color(Colors.greenAccent.shade400.value),
            backgroundColor: Colors.black,
            unselectedItemColor: const Color.fromARGB(255, 76, 136, 79),
            currentIndex: currentIndex,

            onTap: (index) {
              context.read<DrtNavCubit>().changePage(index);
            },

            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.dashboard),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.folder),
                label: "Cases",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month),
                label: "appointments",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month),
                label: "Profile",
              ),
            ],
          ),
        );
      },
    );
  }
}