import 'package:bodycare_ai/costanses/colors.dart';
import 'package:bodycare_ai/pages/dashboard_page.dart';
import 'package:bodycare_ai/widgate/button_widgate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class BodyDiagram extends StatefulWidget {
  BodyDiagram({super.key});
  final colors = constColors();

  @override
  State<BodyDiagram> createState() => _BodyDiagramState();
}

class _BodyDiagramState extends State<BodyDiagram> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Get.back();
              },
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Body Diagram',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: colors.primaryColor,
          ),
        ),
      ),
      // body:ModelViewer(src: 'assets/model/APRILLIA+RSV4.glb') ,
      body: ModelViewer(src: 'assets/model/ecorche_-_anatomy_study.glb'),
      // body: ModelViewer(src: 'assets/model/male_royal_guard.glb'),
    );
  }
}

// main.dart
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:model_viewer_plus/model_viewer_plus.dart';
// import 'package:webview_flutter/webview_flutter.dart'; // required for JavascriptChannel type

// class HotspotController extends GetxController {
//   var selected = ''.obs;
// }

// class BodyDiagram extends StatefulWidget {
//   const BodyDiagram({super.key});
//   @override
//   State<BodyDiagram> createState() => _ModelHotspotScreenState();
// }

// class _ModelHotspotScreenState extends State<BodyDiagram> {
//   final HotspotController ctrl = Get.put(HotspotController());

//   @override
//   Widget build(BuildContext context) {
//     // ********* هنا HTML الداخلي داخل model-viewer *********
//     // لاحظ slot="hotspot-1" و data-position (و data-normal) — غيّر القيم لو احتاجت
//     final innerHtml = '''
//       <!-- زر الهوتسبوت: عند الضغط ينادي قناة Flutter المسماه HotspotChannel -->
//       <button slot="hotspot-1" class="hotspot" 
//               data-position="0m 1.6m 0m" data-normal="0m 1m 0m"
//               onclick="HotspotChannel.postMessage('head')">
//         <!-- محتوى الدائرة؛ يمكنك تغييره -->
//         <div style="width:28px;height:28px;border-radius:50%;background:white;border:2px solid #222;display:flex;align-items:center;justify-content:center;font-size:12px;">H</div>
//       </button>
//     ''';

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('ModelViewer + Hotspot (model_viewer_plus)'),
//       ),
//       body: Column(
//         children: [
//           // ======= Viewer =======
//           Expanded(
//             child: ModelViewer(
//               src:
//                   'assets/model/ecorche_-_anatomy_study.glb', // تأكد إن هذا الملف في assets وسُجّل في pubspec.yaml
//               alt: '3D model',
//               cameraControls: true,
//               backgroundColor: Colors.white,
//               // نضع ال HTML داخل العنصر ليصبح الهوتسبوت مرئياً وملتصق بالموديل
//               innerModelViewerHtml: innerHtml,
//               // نمرر قناة جافاسكريبت حتى نستقبل postMessage من JS
//               javascriptChannels: {
//                 JavascriptChannel(
//                   'HotspotChannel',
//                   onMessageReceived: (JavaScriptMessage jsMsg) {
//                     ctrl.selected.value = jsMsg.message;
//                   },
//                 ),
//               },

//               // (اختياري) استعمل هذا callback لو حبيت تتعامل مع WebViewController لاحقاً
//               onWebViewCreated: (controller) {
//                 // تقدر تستخدم controller.evaluateJavascript(...) لو احتجت
//               },
//             ),
//           ),

//           // ======= شريط بسيط يعرض اسم النقطة باستخدام Obx =======
//           Container(
//             padding: const EdgeInsets.all(12),
//             color: Colors.grey[100],
//             width: double.infinity,
//             child: Row(
//               children: [
//                 const Text(
//                   'Selected: ',
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 Obx(
//                   () => Text(
//                     ctrl.selected.value.isEmpty
//                         ? 'لا يوجد'
//                         : ctrl.selected.value,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
