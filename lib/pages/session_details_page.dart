// lib/pages/session_details_page.dart
import 'package:bodycare_ai/costanses/colors.dart';
import 'package:bodycare_ai/view_model/controller_deshbord.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SessionDetailsPage extends StatelessWidget {
  final int sessionIndex;
  final colors = constColors();

  SessionDetailsPage({super.key, required this.sessionIndex});
  final DashboardController ctrl = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: colors.backgroundColor,
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
                onPressed: () => Get.back(),
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Session Details',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: colors.primaryColor,
            ),
          ),
        ),
        
        
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Card: معلومات الجلسة الأساسية
                Obx(() {
                  final session = ctrl.sessions[sessionIndex];
                  return Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: colors.containerColor,
                      borderRadius: BorderRadius.circular(14.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.05),
                          blurRadius: 12.r,
                          offset: Offset(0, 6.h),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // session title
                        Text(
                          session.title,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 12.h),
                        Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.calendar_today_outlined,
                                  size: 18.sp,
                                  color: colors.primaryColor,
                                ),
                                SizedBox(width: 8.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Date',
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                    SizedBox(height: 4.h),
                                    Text(
                                      session.date,
                                      style: TextStyle(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),

                        SizedBox(height: 18.w),

                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              size: 18.sp,
                              color: Color(0xFF2F80ED),
                            ),
                            SizedBox(height: 8.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Pain Location',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    session.title,
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 12.h),
                        Divider(height: 1.h, color: Colors.grey.shade200),

                        SizedBox(height: 12.h),

                        // Pain intensity + Confidence
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Pain Intensity',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color:colors.primaryColor,
                                    ),
                                  ),
                                  SizedBox(height: 6.h),
                                  Text(
                                    '7/10',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // Confidence chip
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'Confidence',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: colors.primaryColor,
                                  ),
                                ),
                                SizedBox(height: 6.h),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10.w,
                                    vertical: 4.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.green.shade600,
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                  child: Text(
                                    'High',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }),

                SizedBox(height: 18.h),

                // Assessment Result card
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(14.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.04),
                        blurRadius: 10.r,
                        offset: Offset(0, 6.h),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Assessment Result',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 12.h),

                      // Example pill
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: 14.w,
                          vertical: 12.h,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFF2F8FF),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Text(
                          'Muscle Strain',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF2F80ED),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 18.h),

                // Recommendations card
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(14.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.04),
                        blurRadius: 10.r,
                        offset: Offset(0, 6.h),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Recommendations',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 12.h),

                      // list of recommendations (مثال)
                      _recommendationItem(
                        1,
                        'Rest the affected area for 24-48 hours',
                      ),
                      SizedBox(height: 8.h),
                      _recommendationItem(
                        2,
                        'Apply ice for 15-20 minutes every 2-3 hours',
                      ),
                      SizedBox(height: 8.h),
                      _recommendationItem(
                        3,
                        'Use over-the-counter pain relievers as needed',
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20.h),

                // Buttons: Export & Share
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {
                          // تنفيذ عملية التصدير (تستبدل بالوظيفة الحقيقية)
                          Get.snackbar(
                            'Export',
                            'Export tapped',
                            snackPosition: SnackPosition.BOTTOM,
                          );
                        },
                        icon: Icon(
                          Icons.download_outlined,
                          size: 18.sp,
                          color: Color(0xFF2F80ED),
                        ),
                        label: Text(
                          'Export',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Color(0xFF2F80ED),
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 14.h),
                          side: BorderSide(color: Color(0xFF2F80ED)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {
                          Get.snackbar(
                            'Share',
                            'Share tapped',
                            snackPosition: SnackPosition.BOTTOM,
                          );
                        },
                        icon: Icon(
                          Icons.share_outlined,
                          size: 18.sp,
                          color: Color(0xFF2F80ED),
                        ),
                        label: Text(
                          'Share',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Color(0xFF2F80ED),
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 14.h),
                          side: BorderSide(color: Color(0xFF2F80ED)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 14.h),

                Center(
                  child: TextButton(
                    onPressed: () => Get.back(),
                    child: Text(
                      'Back to Dashboard',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ويدجت فرعية لكل عنصر في Recommendations
  Widget _recommendationItem(int idx, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 28.w,
          height: 28.w,
          decoration: BoxDecoration(
            color: colors.primaryColor,
            borderRadius: BorderRadius.circular(22.r),
          ),
          child: Center(
            child: Text(
              idx.toString(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Text(
            text,
            style: TextStyle(fontSize: 13.sp, color: Colors.grey.shade800),
          ),
        ),
      ],
    );
  }
}
