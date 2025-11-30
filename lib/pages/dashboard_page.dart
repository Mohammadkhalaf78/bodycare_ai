import 'package:bodycare_ai/costanses/colors.dart';
import 'package:bodycare_ai/pages/petiant_pages/body_diagram.dart';
import 'package:bodycare_ai/pages/session_details_page.dart';
import 'package:bodycare_ai/view_model/controller_deshbord.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = constColors();
    final ctrl = Get.put(DashboardController());

    return Scaffold(
      backgroundColor: const Color(0xFFF5F8FB),
      body: SafeArea(
        child: Column(
          children: [
            // Header مع تدرج وشكل دائري من الأسفل
            Container(
              width: double.infinity,
              height: 170.h,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [colors.secondaryColor, colors.primaryColor],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(28),
                  bottomRight: Radius.circular(28),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Row للـ avatar وWelcome + name
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 48.w,
                          height: 48.h,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.14),
                            shape: BoxShape.circle,
                          ),
                          child: const Center(
                            child: Icon(Icons.show_chart, color: Colors.white),
                          ),
                        ),
                        SizedBox(width: 12.sp),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Welcome back',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14.sp,
                              ),
                            ),
                            SizedBox(height: 4.sp),
                            Text(
                              'John Doe',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                      ],
                    ),

                    const Spacer(),

                    // زر Start New Diagnosis (بيضاوي داخل الهيدر)
                    Center(
                      child: Container(
                        width: double.infinity,
                        height: 45.h,
                        margin: const EdgeInsets.symmetric(horizontal: 0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: TextButton.icon(
                          onPressed: () {
                            Get.to(() => BodyDiagram());
                          },
                          icon: const Icon(
                            Icons.show_chart,
                            color: Color(0xFF2F80ED),
                          ),
                          label: const Text(
                            'Start New Diagnosis',
                            style: TextStyle(
                              color: Color(0xFF2F80ED),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 4.sp),
                  ],
                ),
              ),
            ),

            // المحتوى تحت الهيدر
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 18.sp),
                    Text(
                      'Recent Sessions',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: colors.textColor,
                      ),
                    ),
                    SizedBox(height: 12.sp),

                    // ListView.builder داخل Expanded — نستخدم Obx لقراءة sessions
                    Expanded(
                      child: Obx(() {
                        return ListView.builder(
                          itemCount: ctrl.sessions.length,
                          padding: const EdgeInsets.only(bottom: 24),
                          itemBuilder: (context, index) {
                            final session = ctrl.sessions[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(14),
                                onTap: () {
                                  Get.to(
                                    () =>
                                        SessionDetailsPage(sessionIndex: index),
                                  );
                                },
                                child: Container(
                                  height: 78.w,
                                  decoration: BoxDecoration(
                                    color: colors.containerColor,
                                    borderRadius: BorderRadius.circular(14),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.blue.withOpacity(0.06),
                                        blurRadius: 10,
                                        offset: const Offset(0, 6),
                                      ),
                                    ],
                                    border: Border.all(
                                      color: Colors.blue.withOpacity(0.06),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 48.w,
                                          height: 48.h,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                            gradient: const LinearGradient(
                                              colors: [
                                                Color(0xFFE8F0FF),
                                                Color(0xFFDDE9FF),
                                              ],
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                            ),
                                          ),
                                          child: const Center(
                                            child: Icon(
                                              Icons.schedule,
                                              color: Color(0xFF2F80ED),
                                            ),
                                          ),
                                        ),

                                        SizedBox(width: 12.w),

                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                session.title,
                                                style: TextStyle(
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              SizedBox(height: 6.sp),
                                              Text(
                                                session.date,
                                                style: TextStyle(
                                                  fontSize: 13.sp,
                                                  color: Colors.grey.shade500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                        Icon(
                                          Icons.arrow_forward_ios,
                                          size: 18.sp,
                                          color: Color(0xFF9BB3D6),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // Bottom navigation bar — نقرأ selectedIndex بدون setState
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          currentIndex: ctrl.selectedIndex.value,
          onTap: ctrl.onItemTapped,
          selectedItemColor: const Color(0xFF2F80ED),
          unselectedItemColor: Colors.grey.shade500,
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(top: 6),
                child: Icon(Icons.home_outlined),
              ),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.show_chart_outlined),
              label: 'Diagnosis',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.lightbulb_outline),
              label: 'Tips',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Profile',
            ),
          ],
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          elevation: 10,
        );
      }),
    );
  }
}
