// lib/main.dart
import 'package:bodycare_ai/core/helpers/spacing.dart';
import 'package:bodycare_ai/core/theming/colors.dart';
import 'package:bodycare_ai/core/theming/style.dart';
import 'package:bodycare_ai/features/patients/doctors/doctor_details/widgets/bottom_sheet.dart';
import 'package:bodycare_ai/features/patients/doctors/doctor_details/widgets/dr_details_content.dart';
import 'package:bodycare_ai/features/patients/doctors/doctor_details/widgets/review_card.dart';
import 'package:bodycare_ai/features/patients/doctors/doctor_details/widgets/smeal_block_details.dart';
import 'package:bodycare_ai/features/users/data/data_story/doctors.dart';
import 'package:bodycare_ai/features/patients/doctors/doctor_details/widgets/name_and_photo_doctor.dart';
import 'package:bodycare_ai/features/users/data/models/doctors_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// لديك كلاس Doctor لتخزين بيانات كل دكتور
class DoctorDetailsPage extends StatelessWidget {
  final FormattedDoctor doctorIndex;
  const DoctorDetailsPage({super.key, required this.doctorIndex});
  
  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorsManeger.darkGreen,
        title: Text('Doctor Details', style: AppTextStyle.font18WhiteBold),
      ),

      backgroundColor: ColorsManeger.mainBlue,
      body: SafeArea(
        child: ListView(
          children: [
            verticalSpace(20),
            NameAndPhotoDoctor(doctorsDatails: doctorIndex),
            // الصورة الدائرية متراكبة
            verticalSpace(35),

            // البلوكات الصغيرة: Rating, Patients, Experience
            SmealBlockDetails(doctor: doctorIndex),
            verticalSpace(12),

            // Next available card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  color: Colors.green[50],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.green.withValues(alpha: .15),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.calendar_today,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Text(
                        'NEXT AVAILABLE',
                        style: TextStyle(fontSize: 12, color: Colors.green),
                      ),
                    ),
                    Text(
                      'doctor.nextAvailable',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Icon(Icons.chevron_right, color: Colors.green),
                  ],
                ),
              ),
            ),

            verticalSpace(18),

            // محتوى الصفحة (About + Patient Reviews)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'About Doctor',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // النص مقيد بخمس أسطر (maxLines: 5)
                    Text(
                      doctorIndex.bio ?? 'No bio available',
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.black87,
                        height: 1.4,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () {
                          // عند الضغط يظهر باقي التفاصيل في Modal Bottom Sheet
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.white,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(16),
                              ),
                            ),
                            builder: (context) {
                              return DrDetailsContent(doctor: doctorIndex);
                            },
                          );
                        },
                        child: const Text(
                          'Read more',
                          style: TextStyle(color: Color(0xFF15A678)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
            
                    // Patient Reviews عنوان
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Patient Reviews',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'See all',
                          style: TextStyle(color: Colors.green),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
            
                    // هنا Row قابل للتمرير أفقياً - ListView.builder داخل SizedBox
                    SizedBox(
                      height: 120.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: doctorsDatails.length,
                        itemBuilder: (context, index) {
                          final d = doctorsDatails[index];
                          return Padding(
                            padding: EdgeInsets.only(
                              left: index == 0 ? 0 : 12,
                              right: index == doctorsDatails.length - 1
                                  ? 8
                                  : 0,
                            ),
                            child: ReviewCard(doctor: d),
                          );
                        },
                      ),
                    ),
            
                    const SizedBox(height: 100), // مسافة لزر الحجز
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // زر Book Appointment أسفل الشاشة
      bottomSheet:BottomSheetWidget(doctor: doctorIndex,),
      
    );
  }
}
