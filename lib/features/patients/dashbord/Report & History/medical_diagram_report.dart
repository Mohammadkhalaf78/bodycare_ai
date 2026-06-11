import 'package:bodycare_ai/core/helpers/spacing.dart';
import 'package:bodycare_ai/core/routing/routes.dart';
import 'package:bodycare_ai/core/theming/colors.dart';
import 'package:bodycare_ai/core/theming/style.dart';
import 'package:bodycare_ai/core/widgets/app_text_button.dart';
import 'package:bodycare_ai/features/patients/dashbord/chat_boot/part_of_model/humen_part_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bodycare_ai/core/helpers/extensions.dart';

/// ================= PAGE =================
class MedicalDiagramReport extends StatelessWidget {
  const MedicalDiagramReport({super.key, required this.bodyPart});
  final String bodyPart; // This should be passed as an argument in real implementation


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManeger.mainBlue,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.w),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReportHeader(),
                    verticalSpace(16),
                    DiagnosisSection(),
                    verticalSpace(16),
                    Humen_Part(bodyPart: bodyPart,h:300,w: 300,),
                    verticalSpace(16),
                    WarningBox(),
                    verticalSpace(16),
                    TreatmentSection(),
                    verticalSpace(16),
                    AdviceSection(),
                    verticalSpace(16),
                    ActionButtons(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// ================= HEADER =================
class ReportHeader extends StatelessWidget {
  const ReportHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Medical Diagnosis Report', style: AppTextStyle.font18BlackBold),
        SizedBox(height: 4.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('AI-generated result', style: AppTextStyle.font12Grayregular),
            StatusBadge(),
          ],
        ),
      ],
    );
  }
}

class StatusBadge extends StatelessWidget {
  const StatusBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: Colors.blue.shade100,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(
        'Diagnosis Ready',
        style: TextStyle(
          fontSize: 12.sp,
          color: Colors.blue,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

/// ================= DIAGNOSIS =================
class DiagnosisSection extends StatelessWidget {
  const DiagnosisSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                'Acute Bronchitis',
                style: AppTextStyle.font20BlackBold,
              ),
            ),
            SeverityBadge(),
          ],
        ),
        SizedBox(height: 8.h),
        Text(
          'Inflammation of the lining of your bronchial tubes, often caused by a viral infection. '
          'Typical symptoms include cough, mucus production, fatigue, and mild fever.',
          style: AppTextStyle.font12Grayregular,
        ),
      ],
    );
  }
}

class SeverityBadge extends StatelessWidget {
  const SeverityBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: Colors.orange.shade100,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Text(
        'Moderate Severity',
        style: TextStyle(fontSize: 11.sp, color: Colors.orange.shade800),
      ),
    );
  }
}

/// ================= WARNING =================
class WarningBox extends StatelessWidget {
  const WarningBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: Colors.red.shade50,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.red.shade200),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.warning_amber_rounded, color: Colors.red, size: 22.sp),
          SizedBox(width: 8.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Immediate Action Required',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  'Monitor breathing closely. Seek medical attention immediately if symptoms worsen.',
                  style: TextStyle(fontSize: 12.sp),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// ================= TREATMENT =================
class TreatmentSection extends StatelessWidget {
  const TreatmentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: 'Treatment Plan & Specialists'),
        SizedBox(height: 10.h),
        TreatmentItem(
          icon: Icons.medication,
          text: 'Medication: Albuterol Inhaler',
        ),
        SizedBox(height: 8.h),
        TreatmentItem(
          icon: Icons.person,
          text: 'Recommended Specialist: Pulmonologist',
        ),
      ],
    );
  }
}

class TreatmentItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const TreatmentItem({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 18.r,
          backgroundColor: Colors.blue.shade50,
          child: Icon(icon, size: 18.sp, color: Colors.blue),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: Text(text, style: TextStyle(fontSize: 13.sp)),
        ),
      ],
    );
  }
}

/// ================= ADVICE =================
class AdviceSection extends StatelessWidget {
  const AdviceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: 'Patient Advice'),
        SizedBox(height: 8.h),
        Text(
          'Get plenty of rest, stay hydrated, and avoid irritants like smoke. '
          'Your body is fighting the infection.',
          style: TextStyle(fontSize: 13.sp),
        ),
      ],
    );
  }
}

/// ================= BUTTONS =================
class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextButton(
          textStyle: AppTextStyle.font18WhiteBold,
          onPressed: () {
            Navigation(context).pushNamed(Routes.doctorsPage);
          },
          buttonText: 'Book an Appointment',
        ),
        SizedBox(height: 10.h),
        SecondaryButton(title: 'back to home screen'),
      ],
    );
  }
}

/// ================= COMMON =================
class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  final String title;

  const SecondaryButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 46.h,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
        onPressed: () {
          Navigation(context).pushNamed(Routes.mainNavigation);
        },
        child: Text(title, style: TextStyle(fontSize: 14.sp)),
      ),
    );
  }
}
