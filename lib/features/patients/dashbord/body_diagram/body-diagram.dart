// ignore: file_names
import 'package:bodycare_ai/core/network/api/dio_consumer.dart';
import 'package:bodycare_ai/core/routing/routes.dart';
import 'package:bodycare_ai/core/theming/colors.dart';
import 'package:bodycare_ai/features/patients/dashbord/body_diagram/cubit/model_cubit.dart';
import 'package:bodycare_ai/features/patients/dashbord/body_diagram/cubit/state_model.dart';
import 'package:bodycare_ai/features/patients/dashbord/body_diagram/widgets/clear_button.dart';
import 'package:bodycare_ai/features/patients/dashbord/body_diagram/widgets/model_aciton_button.dart';
import 'package:bodycare_ai/features/patients/dashbord/body_diagram/widgets/selected-part-header.dart';
import 'package:bodycare_ai/features/patients/dashbord/body_diagram/widgets/taps-counter.dart';
import 'package:bodycare_ai/features/patients/dashbord/chat_boot/cubit/chatboot_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interactive_3d/interactive_3d.dart';
import 'package:bodycare_ai/core/helpers/extensions.dart';

class BodyDiagram extends StatelessWidget {
  const BodyDiagram({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ModelCubit>(create: (context) => ModelCubit()),
        BlocProvider<ChatbootCubit>(
          create: (context) => ChatbootCubit(DioConsumer(dio: Dio())),
        ),
      ],
      child: BlocConsumer<ChatbootCubit, ChatbootState>(
        listener: (context, state) {
          if (state is ChatBootLoading) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('Loading...')));
          }
          if (state is ChatBootSuccess) {
            context.pushReplacementNamed(Routes.chatPage);
          }

          if (state is ChatBootFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('there was an error: ')));
          }
        },
        builder: (context, state) {
          return BlocBuilder<ModelCubit, ModelState>(
            builder: (context, state) {
              return Scaffold(
                appBar: AppBar(
                  title: const Text('Body Diagram Model'),
                  backgroundColor: ColorsManeger.mainBlue,
                ),
                body: Column(
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          Interactive3d(
                            selectionColor: [
                              3,
                              1,
                              1,
                              0,
                            ], // لون التحديد (أخضر في هذا المثال)
                            iblPath: 'assets/env/output_studio_ibl.ktx',
                            skyboxPath: 'assets/env/output_studio_skybox.ktx',
                            modelPath: 'assets/model/alaa2.glb',
                            defaultZoom: 1.7,
                            onSelectionChanged: (entities) {
                              if (entities.isEmpty) return;

                              final partName = entities.first.name;
                              context.read<ModelCubit>().selectPart(partName);
                            },
                          ),

                          /// آخر جزء
                          if (state.lastTappedPart != null)
                            SelectedPartHeader(partName: state.lastTappedPart!),

                          const ClearButton(),
                          TapsCounter(count: state.tappedParts.length),
                          ModelActionButton(
                            onPressed: () {
                              final selectedPart = context
                                  .read<ModelCubit>()
                                  .state
                                  .lastTappedPart;

                              if (selectedPart == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Please select a part of the body first.',
                                    ),
                                  ),
                                );
                                return;
                              }
                              context.read<ChatbootCubit>().sendStartMessage(
                                selectedPart,
                              );
                              context.read<ChatbootCubit>().sendStartMassege(
                                selectedPart,
                              );

                            
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
