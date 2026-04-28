import 'package:bodycare_ai/core/helpers/extensions.dart';
import 'package:bodycare_ai/core/routing/routes.dart';
import 'package:bodycare_ai/core/theming/font_weight_helper.dart';
import 'package:bodycare_ai/features/doctor_profile/data/model.dart';
import 'package:bodycare_ai/features/doctor_profile/data/patient_model.dart';
import 'package:flutter/material.dart';

class AppointmentsScreen extends StatelessWidget {
  const AppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Appointments')),
      body: Center(
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: appointments.length,
          itemBuilder: (context, index) {
            final appointment = appointments[index];
            return Card(
              color: Colors.white,
              margin: const EdgeInsets.only(bottom: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              child: ListTile(
                contentPadding: const EdgeInsets.all(6),
                leading: CircleAvatar(
                  radius: 28,
                  backgroundColor: const Color.fromARGB(51, 17, 212, 153),
                  child: Icon(
                    Icons.person_2_outlined,
                    color: const Color(0xFF11D49A),
                  ),
                ),
                title: Text(
                  "patient: ${appointment.patientName}",
                  style: const TextStyle(
                    fontWeight: FontWeightHelper.semiBold,
                    fontSize: 16,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 4),
            
                    Row(
                      children: [
                        const Icon(
                          Icons.access_time,
                          size: 16,
                          color: Colors.green,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          "${appointment.day} ${appointment.time}",
                          style: const TextStyle(
                            color: Color(0xFF4C9A82),
                            fontSize: 14,
                            fontWeight: FontWeightHelper.regular,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  context.pushNamed(Routes.appointmentDetailsScreen);
                  // Handle navigation or details
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
