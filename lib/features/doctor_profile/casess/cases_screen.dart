import 'package:bodycare_ai/core/helpers/extensions.dart';
import 'package:bodycare_ai/core/routing/routes.dart';
import 'package:bodycare_ai/features/doctor_profile/data/patient_model.dart';
import 'package:bodycare_ai/features/doctor_profile/home_screen/widgets/case_card.dart';
import 'package:flutter/material.dart';

class CasesScreen extends StatelessWidget {
  const CasesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('All Cases')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: patients.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Navigate to case details screen
                context.pushNamed(
                  Routes.caseDatailsScreen,
                  arguments: patients[index],
                );
              },
              child: CaseCard(patient: patients[index]),
            );
          },
        ),
      ),
    );
  }
}
