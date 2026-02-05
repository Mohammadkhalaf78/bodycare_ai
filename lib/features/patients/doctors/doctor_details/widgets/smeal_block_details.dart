import 'package:bodycare_ai/features/users/data/models/doctors_model.dart';
import 'package:flutter/material.dart';

class SmealBlockDetails extends StatelessWidget {
   const SmealBlockDetails({super.key, required this.doctor});

   final FormattedDoctor doctor;

  @override
  Widget build(BuildContext context) {
    return   Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: .03),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _statColumn(Icons.star, '4.5', 'RATING'),
                    _statColumn(Icons.person, '38', 'PATIENTS'),
                    _statColumn(Icons.work, '1.5 ', 'EXP.'),
                  ],
                ),
              ),
            )

        ;
  }
    Widget _statColumn(IconData icon, String value, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Icon(icon, color: Colors.orange.shade400, size: 18),
            const SizedBox(width: 6),
            Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontSize: 11, color: Colors.black54)),
      ],
    );
  }

}