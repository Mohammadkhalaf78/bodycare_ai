import 'package:bodycare_ai/core/cubit/user_cubit.dart';
import 'package:bodycare_ai/core/cubit/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReportDetailsPage extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final reportData;

  const ReportDetailsPage({
    super.key,
    required this.reportData,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Diagnosis Report'),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: ListView(
              children: [
                // ReportItem(
                //   title: 'Diagnosis',
                //   value: reportData.aiReply?.report_data?.diagnosis,
                //   icon: Icons.medical_information,
                // ),
                // ReportItem(
                //   title: 'Immediate Action',
                //   value: reportData.aiReply?.report_data?.immediate_action,
                //   icon: Icons.warning_amber_rounded,
                // ),
                // ReportItem(
                //   title: 'Self Care',
                //   value: reportData.aiReply?.report_data?.self_care,
                //   icon: Icons.healing,
                // ),

                // ReportItem(
                //   title: 'Severity',
                //   value: reportData.aiReply?.report_data?.severity,
                //   icon: Icons.priority_high,
                // ),
                // ReportItem(
                //   title: 'Specialist',
                //   value: reportData.aiReply?.report_data?.specialist,
                //   icon: Icons.local_hospital,
                // ),
                // ReportItem(
                //   title: 'Advice',
                //   value: reportData.aiReply?.report_data?.advice,
                //   icon: Icons.lightbulb_outline,
                // ),
                // ReportItem(
                //   title: 'Possible Cause',
                //   value: reportData.aiReply?.report_data?.cause,
                //   icon: Icons.search,
                // ),
              ],
            ),
          ),
        );
      },
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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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
                    style: const TextStyle(fontSize: 14, color: Colors.black87),
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
