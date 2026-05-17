import 'package:bodycare_ai/core/helpers/extensions.dart';
import 'package:bodycare_ai/core/helpers/spacing.dart';
import 'package:bodycare_ai/core/network/api/dio_consumer.dart';
import 'package:bodycare_ai/core/routing/routes.dart';
import 'package:bodycare_ai/core/theming/colors.dart';
import 'package:bodycare_ai/core/theming/style.dart';
import 'package:bodycare_ai/core/widgets/app_text_button.dart';
import 'package:bodycare_ai/core/widgets/app_text_form_filed.dart';
import 'package:bodycare_ai/features/patients/dashbord/chat_boot/cubit/chatboot_cubit.dart';
import 'package:bodycare_ai/features/patients/dashbord/chat_boot/part_of_model/humen_part_widget.dart';
import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key, required this.selectedPart});
  final String selectedPart;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatbootCubit(DioConsumer(dio: Dio())),
      child: BlocConsumer<ChatbootCubit, ChatbootState>(
        listener: (context, state) {},
        builder: (context, state) {
          return BlocConsumer<ChatbootCubit, ChatbootState>(
            listener: (context, state) {
              if (state is GetReportSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('تم إنشاء التقرير بنجاح')),
                );
                // pass the cubit's current chatboot data to the report page
                context.pushNamed(
                  Routes.medicalDiagramReport,
                  arguments: context.read<ChatbootCubit>().chatboot,
                );
              }
            },
            builder: (context, state) {
              return Scaffold(
                backgroundColor: ColorsManeger.mainBlue,
                appBar: AppBar(
                  backgroundColor: ColorsManeger.wightColor,
                  centerTitle: true,
                  title: Text(
                    'Questionnaire',
                    style: AppTextStyle.font18BlackBold,
                  ),
                ),
                body: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 22),
                      child: Humen_Part(bodyPart: selectedPart),
                    ),
                    verticalSpace(10),
                    context is ChatBootLoading
                        ? CircularProgressIndicator(
                            color: ColorsManeger.lightGreen,
                          )
                        : Expanded(
                            child: ListView.builder(
                              itemCount: context
                                  .watch<ChatbootCubit>()
                                  .chatData
                                  .length,
                              itemBuilder: (context, index) {
                                final message = context
                                    .watch<ChatbootCubit>()
                                    .chatData[index];
                                return BubbleSpecialThree(
                                  text: message.messeges,
                                  color: (message.isSender)
                                      ? ColorsManeger.darkGreen
                                      : ColorsManeger.wightColor,
                                  isSender: message.isSender,
                                  tail: true,
                                  textStyle: message.isSender
                                      ? AppTextStyle.font16whitemedium
                                      : AppTextStyle.font16BlackMedium,
                                );
                              },
                            ),
                          ),

                    Container(
                      decoration: BoxDecoration(
                        color: ColorsManeger.wightColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 8,
                          bottom: 33,
                          left: 22,
                          right: 22,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: AppTextFormFiled(
                                    controller: context
                                        .read<ChatbootCubit>()
                                        .chatBootController,
                                    hintText: 'write here',
                                    backGrgroundColor: ColorsManeger.mainBlue,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: ColorsManeger.mainBlue,
                                        width: .2,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        33.sp,
                                      ),
                                    ),
                                  ),
                                ),
                                horizontalSpace(12),
                                Container(
                                  height: 55.h,
                                  width: 55.w,
                                  decoration: BoxDecoration(
                                    color: ColorsManeger.lightGreen,
                                    borderRadius: BorderRadius.circular(33),
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      context.read<ChatbootCubit>().chatBoot();
                                    },

                                    icon: Icon(
                                      Icons.send,
                                      color: ColorsManeger.wightColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            verticalSpace(10),
                            AppTextButton(
                              borderRadius: 33,
                              horizontalpadding: 1,
                              verticalPadding: 1,
                              buttonWidh: 113.h,
                              buttonHeight: 32.w,
                              backgroundColor: ColorsManeger.mainBlue,

                              textStyle: AppTextStyle.font14GrayMedium,
                              onPressed: () {
                                final cubit = context.read<ChatbootCubit>();

                                context.pushNamed(
                                  Routes.medicalDiagramReport,
                                  arguments: cubit.chatboot,
                                );
                              },
                              buttonText: 'go to report',
                            ),
                          ],
                        ),
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

