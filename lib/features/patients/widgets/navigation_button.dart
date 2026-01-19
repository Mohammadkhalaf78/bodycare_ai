import 'package:bodycare_ai/core/theming/colors.dart';
import 'package:flutter/material.dart';

class NavigationButton extends StatefulWidget {
  const NavigationButton({super.key});

  @override
  State<NavigationButton> createState() => _NavigationButtonState();
}

class _NavigationButtonState extends State<NavigationButton> {
  int selectIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: ColorsManeger.darkGreen,
      currentIndex: selectIndex,
      onTap: (value) {
        onItemTapped(value);
      },
      type: BottomNavigationBarType.fixed,

      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Dashboard'),
        BottomNavigationBarItem(
          icon: Icon(Icons.medical_services),
          label: 'Dactor',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.lightbulb), label: 'Tips'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}
