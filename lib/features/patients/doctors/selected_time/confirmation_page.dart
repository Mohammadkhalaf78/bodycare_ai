import 'package:bodycare_ai/core/helpers/extensions.dart';
import 'package:bodycare_ai/core/helpers/spacing.dart';
import 'package:bodycare_ai/core/theming/style.dart';
import 'package:bodycare_ai/core/widgets/app_text_button.dart';
import 'package:flutter/material.dart';

class ConfirmationScreen extends StatelessWidget {
  final String doctorName;
  final String specialty;
  final String selectedDay;
  final String selectedTime; // ✅ استقبلنا الميعاد هنا

  const ConfirmationScreen({
    super.key,
    required this.doctorName,
    required this.specialty,
    required this.selectedDay,
    required this.selectedTime,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Confirm Appointment')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Color(0xFF13ECAB),
                radius: 55,
                child: Icon(Icons.verified, color: Colors.white, size: 50),
              ),

              verticalSpace(33),

              Text('Booking Confirmed!', style: AppTextStyle.font32BlackBold),
              verticalSpace(8),
              Text(
                'Your appointment with Dr. Evelyn Reed hasbeen successfully booked',
                style: AppTextStyle.font16GrayRegular,
              ),

              const SizedBox(height: 24),
              _infoRow('Doctor', doctorName),
              _infoRow('Specialty', specialty),
              _infoRow('Day', selectedDay),
              _infoRow('Time', selectedTime),

              verticalSpace(40),

              AppTextButton(
                textStyle: AppTextStyle.font18WhiteBold,
                onPressed: () {
                  context.pushReplacementNamed('/mainNavigation');
                },
                buttonText: 'to Home',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: const TextStyle(color: Colors.grey, fontSize: 15),
          ),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
          ),
        ],
      ),
    );
  }
}
