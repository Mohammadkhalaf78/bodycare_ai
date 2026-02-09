import 'package:bodycare_ai/core/cubit/user_cubit.dart';
import 'package:bodycare_ai/core/cubit/user_state.dart';
import 'package:bodycare_ai/features/patients/dashbord/model/detectPart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interactive_3d/interactive_3d.dart';

class TestModel extends StatefulWidget {
  const TestModel({super.key});

  @override
  State<TestModel> createState() => _TestModelState();
}

class _TestModelState extends State<TestModel> {
  String? _lastTappedPart;
  final List<String> _tappedParts = [];

  String _detectBodyPart(Offset position, Size screenSize) {
    final relativeX = position.dx / screenSize.width;
    final relativeY = position.dy / screenSize.height;

    // منطق أكثر دقة لاكتشاف أجزاء الجسم
    // المحور Y (الأفقي)
    if (relativeY < 0.12) return 'Head';

    if (relativeY < 0.20) {
      if (relativeX > 0.35 && relativeX < 0.65) return 'Neck';
      return 'Shoulder';
    }

    if (relativeY < 0.35) {
      if (relativeX < 0.32) return 'Left Shoulder';
      if (relativeX > 0.68) return 'Right Shoulder';
      return 'Chest';
    }

    if (relativeY < 0.45) {
      if (relativeX < 0.25 || relativeX > 0.75) return 'Arm';
      return 'Chest';
    }

    if (relativeY < 0.55) {
      if (relativeX < 0.22 || relativeX > 0.78) return 'Forearm';
      return 'Abdomen';
    }

    if (relativeY < 0.65) {
      if (relativeX < 0.20 || relativeX > 0.80) return 'Wrist';
      return 'Abdomen';
    }

    if (relativeY < 0.75) {
      if (relativeX < 0.25 || relativeX > 0.75) return 'Hand';
      return 'Waist';
    }

    if (relativeY < 0.85) {
      if (relativeX < 0.35 || relativeX > 0.65) return 'Hip';
      return 'Lower Abdomen';
    }

    if (relativeY < 0.92) {
      if (relativeX < 0.35) return 'Left Thigh';
      if (relativeX > 0.65) return 'Right Thigh';
      return 'Thigh';
    }

    if (relativeY < 0.96) {
      if (relativeX < 0.35) return 'Left Knee';
      if (relativeX > 0.65) return 'Right Knee';
      return 'Knee';
    }

    if (relativeY < 0.98) {
      if (relativeX < 0.35) return 'Left Shin';
      if (relativeX > 0.65) return 'Right Shin';
      return 'Leg';
    }

    if (relativeX < 0.35) return 'Left Foot';
    if (relativeX > 0.65) return 'Right Foot';
    return 'Foot';
  }

  void _handleTap(TapDownDetails details, Size screenSize) {
    final bodyPart = _detectBodyPart(details.localPosition, screenSize);

    setState(() {
      _lastTappedPart = bodyPart;
      _tappedParts.add(bodyPart);
    });

    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'You tapped on: $bodyPart',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.blueAccent,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _clearHistory() {
    setState(() {
      _lastTappedPart = null;
      _tappedParts.clear();
    });
  }

  Offset? _lastTapPosition;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: Builder(
            builder: (context) {
              return Stack(
                children: [
                  GestureDetector(
                    onTapDown: (details) {
                      _lastTapPosition = details.localPosition;
                    },
                    child: Interactive3d(
                      onSelectionChanged: (entities) {
                        if (entities.isEmpty) return;

                        final entity = entities.first;

                        final part = detectPart(
                          entityName: entity.name,
                          tap: _lastTapPosition!, // هنخزنها
                          screen: MediaQuery.of(context).size,
                        );

                        setState(() {
                          _lastTappedPart = part.name;
                          _tappedParts.add(part.name);
                        });

                        /// 🔗 ربط مع Cubit
                        context.read<UserCubit>().onModelPartSelected([
                          part.name,
                        ]);
                      },
                      selectionColor: [2,2,2,.2],

                      modelPath: 'assets/model/male_body_base_mesh_highpoly (1).glb',
                      defaultZoom: 1.7,
                      iblPath: 'assets/env/output_studio_ibl.ktx',
                      skyboxPath: 'assets/env/output_studio_skybox.ktx',
                    ),
                  ),
                  // عرض آخر نقطة تم الضغط عليها في الأعلى
                  Positioned(
                    top: 20,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: _lastTappedPart != null
                          ? Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.3),
                                    blurRadius: 8,
                                  ),
                                ],
                              ),
                              child: Text(
                                'Last: $_lastTappedPart',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          : const SizedBox.shrink(),
                    ),
                  ),
                  // زر مسح السجل
                  Positioned(
                    bottom: 20,
                    right: 20,
                    child: FloatingActionButton(
                      onPressed: _clearHistory,
                      backgroundColor: Colors.redAccent,
                      child: const Icon(Icons.clear),
                    ),
                  ),
                  // عرض عدد مرات اللمس
                  Positioned(
                    bottom: 20,
                    left: 20,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'Taps: ${_tappedParts.length}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
