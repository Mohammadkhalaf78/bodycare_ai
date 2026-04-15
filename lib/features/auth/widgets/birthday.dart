import 'package:birth_picker/birth_picker.dart';
import 'package:bodycare_ai/core/theming/colors.dart';
import 'package:flutter/material.dart';

class Birthday extends StatelessWidget {
  const Birthday({super.key});

  @override
  Widget build(BuildContext context) {
    return BirthPicker(
      decorationBuilder: (bol) => BoxDecoration(
        color: ColorsManeger.wightColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: ColorsManeger.gray,
          width: 1,
        ),
      ),
      
    );
  }
}
