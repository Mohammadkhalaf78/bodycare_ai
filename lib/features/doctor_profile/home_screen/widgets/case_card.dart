import 'package:flutter/material.dart';
import '../../data/patient_model.dart';

class CaseCard extends StatelessWidget {
  final PatientModel patient;

  const CaseCard({super.key, required this.patient});

  Color getStatusColor() {
    switch (patient.statusColorType) {
      case 'new':
        return const Color(0xFFFFF0E1);
      case 'review':
        return const Color(0xFFE3EDFF);
      default:
        return const Color(0xFFDDF8E4);
    }
  }

  Color getStatusTextColor() {
    switch (patient.statusColorType) {
      case 'new':
        return const Color(0xFFF97316);
      case 'review':
        return const Color(0xFF2563EB);
      default:
        return const Color(0xFF16A34A);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: const Color(0xFFD7E8E3)),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 32,
            backgroundColor: Color(0xFFDDF5EF),
            child: Icon(Icons.person_outline, color: Color(0xFF2F9E84)),
          ),
          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Patient: ${patient.name}'),
                Text('ID: ${patient.caseId}'),
                Text(patient.time),
              ],
            ),
          ),

          Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: getStatusColor(),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  patient.status,
                  style: TextStyle(color: getStatusTextColor()),
                ),
              ),
              const Icon(Icons.chevron_right),
            ],
          )
        ],
      ),
    );
  }
}