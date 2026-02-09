import 'package:bodycare_ai/core/cubit/user_cubit.dart';
import 'package:bodycare_ai/core/cubit/user_state.dart';
import 'package:bodycare_ai/core/helpers/extensions.dart';
import 'package:bodycare_ai/core/helpers/spacing.dart';
import 'package:bodycare_ai/core/theming/colors.dart';
import 'package:bodycare_ai/core/theming/style.dart';
import 'package:bodycare_ai/core/widgets/app_text_button.dart';
import 'package:bodycare_ai/core/widgets/app_text_form_filed.dart';
import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return BlocConsumer<UserCubit, UserState>(
          listener: (context, state) {
            // TODO: implement listener
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
                  verticalSpace(10),
                  context is chatBootLoading
                      ? CircularProgressIndicator(
                          color: ColorsManeger.lightGreen,
                        )
                      : Expanded(
                          child: ListView.builder(
                            itemCount: context
                                .watch<UserCubit>()
                                .chatData
                                .length,
                            itemBuilder: (context, index) {
                              final message = context
                                  .watch<UserCubit>()
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
                    decoration: BoxDecoration(color: ColorsManeger.wightColor),
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
                                      .read<UserCubit>()
                                      .chatBootController,
                                  hintText: 'write here',
                                  backGrgroundColor: ColorsManeger.mainBlue,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: ColorsManeger.mainBlue,
                                      width: .2,
                                    ),
                                    borderRadius: BorderRadius.circular(33.sp),
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
                                    context.read<UserCubit>().chatBoot();
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
                              final cubit = context.read<UserCubit>();

                              if (cubit.reportModel == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('التقرير لم يتم إنشاؤه بعد'),
                                  ),
                                );
                                return;
                              }

                              context.pushNamed(
                                '/ReportDetailsPage',
                                arguments: cubit.reportModel,
                              );

                              // context.pushNamed(
                              //   '/ReportDetailsPage',
                              //   arguments: {
                              //     context.read<UserCubit>().reportModel,
                              //   },
                              // );
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
    );
  }
}
