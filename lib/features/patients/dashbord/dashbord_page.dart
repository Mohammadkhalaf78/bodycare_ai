import 'package:bodycare_ai/core/cubit/user_cubit.dart';
import 'package:bodycare_ai/core/cubit/user_state.dart';
import 'package:bodycare_ai/core/helpers/extensions.dart';
import 'package:bodycare_ai/core/helpers/spacing.dart';
import 'package:bodycare_ai/core/theming/colors.dart';
import 'package:bodycare_ai/core/theming/style.dart';
import 'package:bodycare_ai/features/patients/widgets/session_item.dart';
import 'package:bodycare_ai/features/users/data/data_story/session_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashBoardPage extends StatelessWidget {
  const DashBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManeger.mainBlue,
      body: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return SafeArea(
            child: Column(
              children: [
                // Top area (avatar + greeting + small icons)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 14,
                  ),
                  child: Row(
                    children: [
                      // avatar
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage(
                          'assets/photo/smaling_avatar.jpg',
                        ),
                      ),
                      const SizedBox(width: 12),
                      // greeting
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hello,',
                              style: AppTextStyle.font14GrayMedium,
                            ),
                            SizedBox(height: 2),
                            Text(
                              'mohamed',
                              // '${context.read<UserCubit>().user!.data.name} 👋',
                              style: AppTextStyle.font18BlackBold,
                            ),
                          ],
                        ),
                      ),

                      // small icons (calendar / notifications)
                    ],
                  ),
                ),

                // content scroll area
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 6,
                    ),
                    child: Column(
                      children: [
                        // --- Big green card with body image + text + small white card below (floating)
                        Container(
                          width: double.infinity,
                          height: 222,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                ColorsManeger.darkGreen,
                                ColorsManeger.lightGreen,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withAlpha(0x08),
                                blurRadius: 18,
                                offset: const Offset(0, 8),
                              ),
                            ],
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 166,
                                height: double.infinity,
                                alignment: Alignment.center,
                                child: Opacity(
                                  opacity: 0.95,
                                  child: Image.asset('assets/photo/body.png'),
                                ),
                              ),

                              // horizontalSpace(35),

                              // right: text and button
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'How are you feeling\ntoday?',
                                    style: AppTextStyle.font16whitemedium,
                                  ),
                                  const SizedBox(height: 12),
                                  ElevatedButton(
                                    onPressed: () {
                                      context.pushNamed('/BodyDiagram');
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 18,
                                        vertical: 10,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    child: Text(
                                      'Start Diagnosis',
                                      style: AppTextStyle.font16whitemedium
                                          .copyWith(
                                            color: ColorsManeger.darkGreen,
                                            fontWeight: FontWeight.w700,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        verticalSpace(33),
                        // Recent Sessions header
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Recent Sessions',
                              style: AppTextStyle.font16BlackMedium,
                            ),
                            Text(
                              'View All',
                              style: AppTextStyle.font14DarkGreenSemiBold,
                            ),
                          ],
                        ),

                        verticalSpace(16),

                        // List of sessions (example)
                        ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: sessionsData.length,
                          itemBuilder: (contex, index) {
                            return SessionItem(
                              ontap: () {
                                context.pushNamed(
                                  '/SessionDetails',
                                  arguments: sessionsData[index],
                                );
                              },
                              title: sessionsData[index].title,
                              date: sessionsData[index].date,
                              status: sessionsData[index].status,
                            );
                          },
                        ),

                        ElevatedButton(
                          onPressed: () {
                            context.pushNamed('/TestModel');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorsManeger.darkGreen,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 10,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            'view test model',
                            style: AppTextStyle.font16whitemedium.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),

                        //
                        // const SizedBox(height: 100),
                      ],
                    ),
                  ),
                ),

                // Bottom navigation (simple)
              ],
            ),
          );
        },
      ),
    );
  }
}
