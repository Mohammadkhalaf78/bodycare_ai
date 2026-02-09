import 'package:bodycare_ai/core/cubit/user_cubit.dart';
import 'package:bodycare_ai/core/cubit/user_state.dart';
import 'package:bodycare_ai/core/helpers/extensions.dart';
import 'package:bodycare_ai/core/theming/colors.dart';
import 'package:bodycare_ai/core/theming/style.dart';
import 'package:bodycare_ai/core/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class BodyDiagram extends StatefulWidget {
  const BodyDiagram({super.key});

  @override
  State<BodyDiagram> createState() => _BodyDiagramState();
}

class _BodyDiagramState extends State<BodyDiagram> {
  String? selectedPart;

  final List<String> bodyParts = [
    'Head',
    'Chest',
    'Abdomen',
    'Left Shoulder',
    'Right Shoulder',
    'Left Arm',
    'Right Arm',
    'Left Leg',
    'Right Leg',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is chatBootSuccess) {
          context.pushReplacementNamed('/ChatPage');
        }
      },
      builder: (context, state) {
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

                          Expanded(
                            child: Column(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 300,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade100,
                                      borderRadius: BorderRadius.circular(12.r),
                                    ),
                                    clipBehavior: Clip.antiAlias,
                                    child: Stack(
                                      children: [
                                        // 3D Model Viewer
                                        ModelViewer(
                                          src:
                                              'assets/model/perfect_human_body.glb',
                                          alt: 'Human Body 3D Model',
                                          ar: false,
                                          autoRotate: true,
                                          cameraControls: true,
                                          backgroundColor: Colors.grey.shade100,
                                        ),
                                        // Interactive Hotspots overlaid on the model
                                        Positioned(
                                          left: 133.w,
                                          top: 11.h,
                                          child: _buildHotspot('Head'),
                                        ),
                                        Positioned(
                                          left: 133.w,
                                          top: 50.h,
                                          child: _buildHotspot('Chest'),
                                        ),
                                        Positioned(
                                          left: 120.w,
                                          top: 44.h,
                                          child: _buildHotspot('Left Shoulder'),
                                        ),
                                        Positioned(
                                          right: 120.w,
                                          top: 44.h,
                                          child: _buildHotspot(
                                            'Right Shoulder',
                                          ),
                                        ),
                                        Positioned(
                                          left: 100.w,
                                          top: 70.h,
                                          child: _buildHotspot('Left Arm'),
                                        ),
                                        Positioned(
                                          right: 100.w,
                                          top: 70.h,
                                          child: _buildHotspot('Right Arm'),
                                        ),
                                        Positioned(
                                          left: 133.w,
                                          top: 70.h,
                                          child: _buildHotspot('Abdomen'),
                                        ),
                                        Positioned(
                                          left: 120.w,
                                          bottom: 40.h,
                                          child: _buildHotspot('Left Leg'),
                                        ),
                                        Positioned(
                                          right: 120.w,
                                          bottom: 40.h,
                                          child: _buildHotspot('Right Leg'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                SizedBox(height: 12.h),

                                /// Body Parts Selection Grid
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.all(12.w),
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(0, 255, 255, 255),
                                    borderRadius: BorderRadius.circular(8.r),
                                    border: Border.all(
                                      color: const Color.fromARGB(0, 224, 224, 224),
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Select body part:',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold,
                                          color: ColorsManeger.mainBlue,
                                        ),
                                      ),
                                      SizedBox(height: 8.h),
                                      Wrap(
                                        spacing: 8.w,
                                        runSpacing: 8.h,
                                        children: bodyParts.map((part) {
                                          final isSelected =
                                              selectedPart == part;
                                          return GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                selectedPart = part;
                                              });
                                              context
                                                  .read<UserCubit>()
                                                  .onModelPartSelected([part]);
                                            },
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 12.w,
                                                vertical: 8.h,
                                              ),
                                              decoration: BoxDecoration(
                                                color: isSelected
                                                    ? ColorsManeger.mainBlue
                                                    : Colors.grey.shade100,
                                                borderRadius:
                                                    BorderRadius.circular(20.r),
                                                border: Border.all(
                                                  color: isSelected
                                                      ? ColorsManeger.mainBlue
                                                      : Colors.grey.shade300,
                                                ),
                                              ),
                                              child: Text(
                                                part,
                                                style: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: isSelected
                                                      ? Colors.white
                                                      : Colors.black87,
                                                  fontWeight: isSelected
                                                      ? FontWeight.bold
                                                      : FontWeight.normal,
                                                ),
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ],
                                  ),
                                ),

                                /// INFO PANEL
                                if (selectedPart != null) ...[
                                  SizedBox(height: 12.h),
                                  Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.all(12.w),
                                    decoration: BoxDecoration(
                                      color: Colors.blue.shade50,
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.info_outline,
                                          color: ColorsManeger.mainBlue,
                                          size: 20.sp,
                                        ),
                                        SizedBox(width: 8.w),
                                        Expanded(
                                          child: Text(
                                            'Selected: $selectedPart',
                                            style: TextStyle(
                                              fontSize: 13.sp,
                                              color: Colors.black87,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ],
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
                            onPressed: () {
                              if (selectedPart == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Please select an area where you feel pain'),
                                  ),
                                );
                                return;
                              }
                              context.read<UserCubit>().sendStartMassege(selectedPart!);
                              context.pushReplacementNamed('/ChatPage');
                            },
                            buttonText: 'Next',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildHotspot(String bodyPart) {
    final isSelected = selectedPart == bodyPart;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPart = bodyPart;
        });
        context.read<UserCubit>().onModelPartSelected([bodyPart]);
      },
      child: Container(
        width: 25.w,
        height: 25.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected
              ? const Color.fromARGB(0, 226, 232, 240).withValues(alpha: 0.2)
              : Colors.transparent,
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.4),
            width: 2,
          ),
        ),
        child: Center(
          child: Icon(
            Icons.touch_app,
            color: const Color.fromARGB(0, 255, 255, 255).withValues(alpha: 0.5),
            size: 20.sp,
          ),
        ),
      ),
    );
  }
}
