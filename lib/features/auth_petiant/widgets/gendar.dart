import 'package:flutter/material.dart';

class Gendar extends StatefulWidget {
   const Gendar({super.key});

  @override
  State<Gendar> createState() => _GendarState();
}

class _GendarState extends State<Gendar> {
   String? gender;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ChoiceChip(
          label: const Text('Male'),
          selected: gender == 'male',
          onSelected: (_) {
            setState(() => gender = 'male');
          },
        ),
        const SizedBox(width: 10),
        ChoiceChip(
          label: const Text('Female'),
          selected: gender == 'female',
          onSelected: (_) {
            setState(() => gender = 'female');
          },
        ),
      ],
    );
  }
}