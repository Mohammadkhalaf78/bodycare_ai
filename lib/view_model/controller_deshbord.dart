// نموذج بيانات للجلسة
import 'package:get/get.dart';

class Session {
  final String title;
  final String date;

  Session({required this.title, required this.date});
}

// Controller باستخدام GetX
class DashboardController {
  // اختيارات يمكن تعديلها لاحقًا من طرفك كـ .obs
  final selectedIndex = 0.obs;

  // قائمة الجلسات، جاهزة لتتحول أو تُعدل كـ obs (هى بالفعل RxList)
  final sessions = <Session>[
    Session(title: 'Lower Back Pain', date: 'Oct 20, 2025'),
    Session(title: 'Headache', date: 'Oct 15, 2025'),
    Session(title: 'Knee Pain', date: 'Oct 10, 2025'),
  ].obs;

  // دوال تعامل مع النقرات
  void onItemTapped(int idx) {
    selectedIndex.value = idx;
    // مثال: تظهر رسالة قصيرة — تقدر تستبدلها بـ Get.to(...) للتنقل
    Get.snackbar(
      'Tab',
      'Selected tab: $idx',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void onSessionTapped(int index) {
    final s = sessions[index];
    // مثال: تستخدم Get.to(DetailPage(...)) لو عندك صفحة تفاصيل
    Get.snackbar(
      'Session tapped',
      s.title,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void startNewDiagnosis() {
    Get.snackbar(
      'Action',
      'Start New Diagnosis',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}