import 'package:bodycare_ai/features/patients/dashbord/body_diagram/cubit/model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClearButton extends StatelessWidget {
  const ClearButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 77,
      right: 20,
      child: FloatingActionButton(
        onPressed: () {
          context.read<ModelCubit>().clearHistory();
        },
        child: const Icon(Icons.clear),
      ),
    );
  }
}
