import 'package:bodycare_ai/core/helpers/spacing.dart';
import 'package:bodycare_ai/core/theming/colors.dart';
import 'package:bodycare_ai/core/theming/style.dart';
import 'package:bodycare_ai/core/widgets/app_text_button.dart';
import 'package:bodycare_ai/core/widgets/app_text_form_filed.dart';
import 'package:bodycare_ai/features/users/data/data_story/chat_data.dart';
import 'package:bodycare_ai/features/users/data/models/messeges_model.dart';
import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});
  final TextEditingController messeges = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManeger.mainBlue,
      appBar: AppBar(
        backgroundColor: ColorsManeger.wightColor,
        centerTitle: true,
        title: Text('Questionnaire', style: AppTextStyle.font18BlackBold),
      ),
      body: Column(
        children: [
          verticalSpace(10),
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: chatData.length,
                itemBuilder: (context, index) {
                  return BubbleSpecialThree(
                    text: chatData[index].messeges.toString(),
                    color: (chatData[index].isSender ) ? ColorsManeger.darkGreen : ColorsManeger.wightColor,
                    isSender: chatData[index].isSender ,
                    tail: true,
                    textStyle: chatData[index].isSender  ? AppTextStyle.font16whitemedium: AppTextStyle.font16BlackMedium,
                  );
                },
              ),
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
                          controller: messeges,
                          hintText: 'write here',
                          backGrgroundColor: ColorsManeger.mainBlue,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorsManeger.mainBlue,
                              width: .2
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
                            chatData.add(MessegesModel(messeges: messeges.text,isSender: true));
                            messeges.clear();
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
                    borderRadius: 33 ,
                    horizontalpadding: 1,
                    verticalPadding: 1,
                    buttonWidh: 113.h,
                    buttonHeight: 32.w,
                    backgroundColor: ColorsManeger.mainBlue,

                    textStyle: AppTextStyle.font14GrayMedium,
                    onPressed: () {},
                    buttonText: 'I don\'t know',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
