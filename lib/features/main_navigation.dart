import 'package:bodycare_ai/core/theming/colors.dart';
import 'package:bodycare_ai/features/patients/dashbord/dashbord_page.dart';
import 'package:bodycare_ai/features/patients/doctors_page.dart';
import 'package:bodycare_ai/features/patients/profile_page.dart';
import 'package:bodycare_ai/features/patients/tips_page.dart';
import 'package:flutter/material.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() =>
      _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int currentIndex = 0;
  List<Widget> pages = [
    DashBoardPage(),
    DoctorsPage(),
    TipsPage(),
    ProfilePage(),
    // Add your pages here
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: ColorsManeger.darkGreen,
        unselectedItemColor: ColorsManeger.gray,


        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Dashboard'),
          BottomNavigationBarItem(
            icon: Icon(Icons.medical_services),
            label: 'Doctors',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.lightbulb), label: 'Tips'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
