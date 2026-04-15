import 'package:bodycare_ai/core/cubit/doctor_cubit.dart';
import 'package:bodycare_ai/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Dropdownlabelwidget extends StatelessWidget {
  const Dropdownlabelwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      borderRadius: BorderRadius.circular(10),
      decoration: InputDecoration(
        focusColor: ColorsManeger.primary,
        labelText: 'Specialty',
        border: OutlineInputBorder(
          
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      initialValue: context.read<DoctorCubit>().doctorSpecialty,
      items: [
        DropdownMenuItem(value: 'Cardiology', child: Text('Cardiology')),
        DropdownMenuItem(value: 'Neurology', child: Text('Neurology')),
        DropdownMenuItem(value: 'Pediatrics', child: Text('Pediatrics')),
        DropdownMenuItem(value: 'Orthopedics', child: Text('Orthopedics')),
        DropdownMenuItem(value: 'Oncology', child: Text('Oncology')),
        DropdownMenuItem(value: 'Dermatology', child: Text('Dermatology')),
      ],
      onChanged: (value) {
        context.read<DoctorCubit>().changeSpecialty(value!);
      },
    );
  }
}
