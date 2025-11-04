import 'package:bodycare_ai/costanses/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SimpleTextField extends StatelessWidget {
  final String hint;
  final IconData icon;


  SimpleTextField({super.key, required this.hint, required this.icon});

  final colors = constColors();

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hint:Text('$hint',style: TextStyle(fontSize: 10.sp),) ,
        border: InputBorder.none,
      

        prefixIcon: Icon(icon, color: colors.secondaryColor),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: Colors.black, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: colors.primaryColor, width: 1),
        ),
      ),
    );
  }
}
