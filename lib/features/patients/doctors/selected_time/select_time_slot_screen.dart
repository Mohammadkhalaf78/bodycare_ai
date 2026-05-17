import 'package:bodycare_ai/core/helpers/spacing.dart';
import 'package:bodycare_ai/features/patients/doctors/selected_time/confirmation_page.dart';
import 'package:flutter/material.dart';

// ============================================================
// 1. MODEL - بيانات الميعاد
// ============================================================
class AppointmentSlot {
  final String time;
  final bool isAvailable;

  const AppointmentSlot({required this.time, this.isAvailable = true});
}

// ============================================================
// 2. DATA - المواعيد في variables
// ============================================================
const List<AppointmentSlot> morningSlots = [
  AppointmentSlot(time: '09:00 AM'),
  AppointmentSlot(time: '09:30 AM'),
  AppointmentSlot(time: '10:00 AM'),
  AppointmentSlot(time: '10:30 AM'),
  AppointmentSlot(time: '11:00 AM', isAvailable: false), // محجوز
];

const List<AppointmentSlot> afternoonSlots = [
  AppointmentSlot(time: '01:00 PM'),
  AppointmentSlot(time: '01:30 PM'),
  AppointmentSlot(time: '02:15 PM'),
  AppointmentSlot(time: '03:00 PM', isAvailable: false), // محجوز
  AppointmentSlot(time: '03:45 PM'),
];

// أيام الأسبوع
const List<Map<String, String>> weekDays = [
  {'day': 'Mon', 'date': '23'},
  {'day': 'Tue', 'date': '24'},
  {'day': 'Wed', 'date': '25'},
  {'day': 'Thu', 'date': '26'},
];

// ============================================================
// 3. SCREEN
// ============================================================
class SelectTimeSlotScreen extends StatefulWidget {
  const SelectTimeSlotScreen({super.key});

  @override
  State<SelectTimeSlotScreen> createState() => _SelectTimeSlotScreenState();
}

class _SelectTimeSlotScreenState extends State<SelectTimeSlotScreen> {
  // ✅ المتغيرات اللي بتحفظ الاختيار
  int selectedDayIndex = 0;
  String? selectedTime; // الميعاد المختار

  // ألوان التطبيق
  static const Color primaryColor = Color(0xFF2E9E8E);
  static const Color lightGrey = Color(0xFFF5F6FA);
  static const Color textDark = Color(0xFF1A1A2E);
  static const Color textGrey = Color(0xFF9E9E9E);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDoctorCard(),
                  const SizedBox(height: 20),
                  _buildDaySelector(),
                  const SizedBox(height: 24),
                  _buildSlotsSection('Morning', morningSlots),
                  const SizedBox(height: 20),
                  _buildSlotsSection('Afternoon', afternoonSlots),
                  const SizedBox(height: 12),
                  Center(
                    child: Text(
                      'All times are in your local time (PST)',
                      style: TextStyle(color: textGrey, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ),
          _buildBottomButton(context),
          verticalSpace(22)
        ],
      ),
    );
  }

  // ============================================================
  // WIDGETS
  // ============================================================

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: const BackButton(color: textDark),
      title: const Text(
        'Select Time Slot',
        style: TextStyle(
          color: textDark,
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
      ),
      centerTitle: true,
    );
  }

  Widget _buildDoctorCard() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: lightGrey,
            // ضع صورة الدكتور هنا
            child: const Icon(Icons.person, color: primaryColor, size: 30),
          ),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Dr. Evelyn Reed',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: textDark,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Orthopedic Surgeon',
                style: TextStyle(color: textGrey, fontSize: 13),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDaySelector() {
    return Row(
      children: [
        ...List.generate(weekDays.length, (index) {
          final day = weekDays[index];
          final isSelected = selectedDayIndex == index;

          return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedDayIndex = index;
                  selectedTime = null; // نمسح الاختيار لما نغير اليوم
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: isSelected ? primaryColor : lightGrey,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Text(
                      day['day']!,
                      style: TextStyle(
                        fontSize: 12,
                        color: isSelected ? Colors.white : textGrey,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      day['date']!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: isSelected ? Colors.white : textDark,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
        const SizedBox(width: 4),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: lightGrey,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(Icons.calendar_month_outlined,
              color: primaryColor, size: 20),
        ),
      ],
    );
  }

  Widget _buildSlotsSection(String title, List<AppointmentSlot> slots) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
            color: textDark,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: slots.map((slot) => _buildSlotChip(slot)).toList(),
        ),
      ],
    );
  }

  Widget _buildSlotChip(AppointmentSlot slot) {
    final isSelected = selectedTime == slot.time;
    final isBooked = !slot.isAvailable;

    return GestureDetector(
      onTap: isBooked
          ? null // مش هيتحدد لو محجوز
          : () {
              setState(() {
                selectedTime = slot.time; // ✅ بنحفظ الميعاد هنا
              });
            },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected
              ? primaryColor
              : isBooked
                  ? lightGrey
                  : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected
                ? primaryColor
                : isBooked
                    ? Colors.transparent
                    : Colors.grey.shade200,
            width: 1.5,
          ),
        ),
        child: Text(
          slot.time,
          style: TextStyle(
            color: isSelected
                ? Colors.white
                : isBooked
                    ? textGrey
                    : textDark,
            fontWeight: FontWeight.w500,
            fontSize: 13,
            decoration: isBooked ? TextDecoration.lineThrough : null,
            decorationColor: textGrey,
          ),
        ),
      ),
    );
  }

  Widget _buildBottomButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: SizedBox(
        width: double.infinity,
        height: 54,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor:
                selectedTime != null ? primaryColor : Colors.grey.shade300,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            elevation: 0,
          ),
          onPressed: selectedTime == null
              ? null
              : () {
                  // ✅ بنبعت الميعاد والتاريخ للصفحة التانية
                  final selectedDay = weekDays[selectedDayIndex];
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ConfirmationScreen(
                        doctorName: 'Dr. Evelyn Reed',
                        specialty: 'Orthopedic Surgeon',
                        selectedDay:
                            '${selectedDay['day']}, ${selectedDay['date']}',
                        selectedTime: selectedTime!,
                      ),
                    ),
                  );
                },
          child: const Text(
            'Continue',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }



}

// ============================================================
// 4. الصفحة التانية - بتستقبل البيانات
// ============================================================

// ============================================================
// 5. MAIN - نقطة البداية
// ============================================================
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doctor App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const SelectTimeSlotScreen(),
    );
  }
}
