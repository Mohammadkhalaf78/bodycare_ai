import 'package:bodycare_ai/core/helpers/extensions.dart';
import 'package:bodycare_ai/core/theming/colors.dart';
import 'package:bodycare_ai/core/theming/style.dart';
import 'package:bodycare_ai/core/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class BodyDiagram extends StatefulWidget {
  const BodyDiagram({super.key});

  @override
  State<BodyDiagram> createState() => _BodyDiagramState();
}

class _BodyDiagramState extends State<BodyDiagram> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsManeger.mainBlue,
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Container(
              width: 40.w,
              height: 40.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [
                  BoxShadow(
                    // ignore: deprecated_member_use
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 8.r,
                    offset: Offset(0, 4.h),
                  ),
                ],
              ),
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 18.sp,
                  color: Colors.black87,
                ),
                onPressed: () {
                  context.pop();
                },
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text('Body Diagram', style: AppTextStyle.font32GreenBold),
        ),
        // body:ModelViewer(src: 'assets/model/APRILLIA+RSV4.glb') ,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                right: 22,
                left: 22,
                top: 10,
                bottom: 10,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: ColorsManeger.wightColor,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                width: double.infinity,
                height: 630.h,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Select the area where you feel pain',
                        style: AppTextStyle.font14GrayMedium,
                      ),
                      SizedBox(
                        height: 450.h,
                        child: ModelViewer(
                          src: 'assets/model/ecorche_-_anatomy_study.glb',
                        ),
                      ),
                      AppTextButton(
                        textStyle: AppTextStyle.font18WhiteBold.copyWith(
                          shadows: [
                            Shadow(
                              color: Colors.black.withValues(alpha: 0.25),
                              blurRadius: 4.r,
                              offset: Offset(0, 2.h),
                            ),
                          ],
                        ),
                        onPressed: () {},
                        buttonText: 'Next',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        // body: ModelViewer(src: 'assets/model/male_royal_guard.glb'),
      ),
    );
  }
}
