import 'package:flutter/material.dart';

class TapsCounter extends StatelessWidget {
  final int count;

  const TapsCounter({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 77,
      left: 20,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          'Taps: $count',
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
