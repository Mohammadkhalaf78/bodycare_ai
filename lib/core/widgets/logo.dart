import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return               Container(
                width: 90.w,
                height: 90.h,
                decoration: BoxDecoration(
                  color: const Color(0xFFD5F1E9),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  Icons.health_and_safety,
                  color: Color(0xFF1BA97C),
                  size: 40,
                ),
              )

            ;
  }
}