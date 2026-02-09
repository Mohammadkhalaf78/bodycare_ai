import 'package:bodycare_ai/features/users/data/models/report_model.dart';
import 'package:flutter/material.dart';

class ReportDetailsPage extends StatelessWidget {
  final ReportModel reportData;

  const ReportDetailsPage({
    super.key,
    required this.reportData,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diagnosis Report'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            ReportItem(
              title: 'Diagnosis',
              value: reportData.diagnosis,
              icon: Icons.medical_information,
            ),
            ReportItem(
              title: 'Immediate Action',
              value: reportData.specialist,
              icon: Icons.warning_amber_rounded,
            ),
            ReportItem(
              title: 'Medication',
              value: reportData.medication,
              icon: Icons.medication,
            ),
            ReportItem(
              title: 'Severity',
              value: reportData.severity,
              icon: Icons.priority_high,
            ),
            ReportItem(
              title: 'Specialist',
              value: reportData.specialist,
              icon: Icons.local_hospital,
            ),
            ReportItem(
              title: 'Advice',
              value: reportData.advice,
              icon: Icons.lightbulb_outline,
            ),
            ReportItem(
              title: 'Possible Cause',
              value: reportData.cause,
              icon: Icons.search,
            ),
          ],
        ),
      ),
    );
  }
}




class ReportItem extends StatelessWidget {
  final String title;
  final String? value;
  final IconData icon;

  const ReportItem({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: Colors.green, size: 28),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    value ?? 'Not available',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

