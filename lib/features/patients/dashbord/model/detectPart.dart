import 'package:bodycare_ai/features/patients/dashbord/model/enum.dart';
import 'package:flutter/material.dart';

BodyPart detectPart({
  required String entityName,
  required Offset tap,
  required Size screen,
}) {
  final x = tap.dx / screen.width;
  final y = tap.dy / screen.height;

  final name = entityName.toLowerCase();

  /// 🎯 First check by entity name if available
  if (name.contains('head')) return BodyPart.head;
  if (name.contains('chest') || name.contains('shoulder')) return BodyPart.chest;
  if (name.contains('abdomen') || name.contains('stomach') || name.contains('waist')) {
    return BodyPart.abdomen;
  }
  if (name.contains('arm')) {
    return x < 0.5 ? BodyPart.leftArm : BodyPart.rightArm;
  }
  if (name.contains('leg') || name.contains('knee') || name.contains('foot') || name.contains('shin')) {
    return x < 0.5 ? BodyPart.leftLeg : BodyPart.rightLeg;
  }

  /// 🧠 Fallback with improved precision (Screen coordinates)
  // Head: Top 15%
  if (y < 0.15) return BodyPart.head;
  
  // Chest: 15-40%
  if (y < 0.40) return BodyPart.chest;
  
  // Abdomen: 40-65%
  if (y < 0.65) return BodyPart.abdomen;
  
  // Legs: 65-100% (bottom 35%)
  if (y >= 0.65) {
    return x < 0.5 ? BodyPart.leftLeg : BodyPart.rightLeg;
  }

  return BodyPart.unknown;
}
