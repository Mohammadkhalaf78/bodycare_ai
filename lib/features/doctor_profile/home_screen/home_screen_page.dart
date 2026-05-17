import 'package:bodycare_ai/core/helpers/extensions.dart';
import 'package:bodycare_ai/core/routing/routes.dart';
import 'package:bodycare_ai/core/theming/font_weight_helper.dart';
import 'package:bodycare_ai/features/doctor_profile/casess/cases_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/patient_model.dart';

class BottomNavCubit extends Cubit<int> {
  BottomNavCubit() : super(0);

  void changeIndex(int index) {
    emit(index);
  }
}

class HomeScreenDoctorPage extends StatelessWidget {
  const HomeScreenDoctorPage({super.key});

  @override
  Widget build(BuildContext context) {
    const bgColor = Color(0xFFF7FAF9);
    const primaryGreen = Color(0xFF2F9E84);
    const cardBorder = Color(0xFFD1E8E2);
    const textDark = Color(0xFF101828);

    final firstThree = patients.take(3).toList();

    return BlocProvider(
      create: (context) => BottomNavCubit(),
      child: Scaffold(
        backgroundColor: bgColor,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),

                      /// HEADER
                      _HeaderSection(
                        primaryGreen: primaryGreen,
                        textDark: textDark,
                      ),

                      const SizedBox(height: 28),

                      /// STATS
                      _StatsRow(
                        primaryGreen: primaryGreen,
                        cardBorder: cardBorder,
                        textDark: textDark,
                      ),

                      const SizedBox(height: 30),

                      /// TITLE + SEE ALL
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Recent Cases',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: textDark,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const CasesScreen(),
                                ),
                              );
                            },
                            child: Text(
                              'See All',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: primaryGreen,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 18),

                      /// CASES LIST (dynamic)
                    
                      ...firstThree.map(
                        (patient) => GestureDetector(
                          onTap: (){
                            context.pushNamed(
                              Routes.caseDatailsScreen,
                              arguments: patient,
                            );
                          },
                          child: _CaseCard(patient: patient)),
                      ),

                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        // bottomNavigationBar: _BottomNavBar(),
      ),
    );
  }
}

////////////////////////////////////////////////////////////
/// HEADER
////////////////////////////////////////////////////////////

class _HeaderSection extends StatelessWidget {
  final Color primaryGreen;
  final Color textDark;

  const _HeaderSection({required this.primaryGreen, required this.textDark});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Good morning,',
              style: TextStyle(fontSize: 16, color: primaryGreen),
            ),
            const SizedBox(height: 6),
            Text(
              'Dr. Smith',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: textDark,
              ),
            ),
          ],
        ),
        const CircleAvatar(
          radius: 22,
          backgroundColor: Color(0xFF90A7A1),
          child: Icon(Icons.person, color: Colors.white),
        ),
      ],
    );
  }
}

////////////////////////////////////////////////////////////
/// STATS
////////////////////////////////////////////////////////////

class _StatsRow extends StatelessWidget {
  final Color primaryGreen;
  final Color cardBorder;
  final Color textDark;

  const _StatsRow({
    required this.primaryGreen,
    required this.cardBorder,
    required this.textDark,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(
          child: _StatCard(title: 'New Cases', value: '12'),
        ),
        SizedBox(width: 14),
        Expanded(
          child: _StatCard(title: 'In Review', value: '5'),
        ),
        SizedBox(width: 14),
        Expanded(
          child: _StatCard(title: 'Completed', value: '38'),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;

  const _StatCard({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 111,
      width: 103,
      padding: const EdgeInsets.only(top: 16, left: 12, right: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFD1E8E2)),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeightHelper.medium,
              color: Color(0xFF5E7C75),
            ),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

////////////////////////////////////////////////////////////
/// CASE CARD (dynamic)
////////////////////////////////////////////////////////////

class _CaseCard extends StatelessWidget {
  final PatientModel patient;

  const _CaseCard({required this.patient});

  Color getBg() {
    switch (patient.status) {
      case 'New':
        return const Color(0xFFFFF0E1);
      case 'In Review':
        return const Color(0xFFE3EDFF);
      default:
        return const Color(0xFFDDF8E4);
    }
  }

  Color getTextColor() {
    switch (patient.status) {
      case 'New':
        return const Color(0xFFF97316);
      case 'In Review':
        return const Color(0xFF2563EB);
      default:
        return const Color(0xFF16A34A);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: const Color(0xFFD7E8E3)),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 32,
            backgroundColor: Color(0xFFDDF5EF),
            child: Icon(Icons.person_outline, color: Color(0xFF2F9E84)),
          ),
          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Patient: ${patient.name}'),
                Text('ID: ${patient.caseId}'),
                Text(patient.time),
              ],
            ),
          ),

          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: getBg(),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  patient.status,
                  style: TextStyle(color: getTextColor()),
                ),
              ),
              const SizedBox(width: 6),
              const Icon(Icons.chevron_right),
            ],
          ),
        ],
      ),
    );
  }
}

////////////////////////////////////////////////////////////
/// BOTTOM NAV (with navigation)
////////////////////////////////////////////////////////////

// class _BottomNavBar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       type: BottomNavigationBarType.fixed,
//       backgroundColor: Colors.white,
//       currentIndex: 0,
//       onTap: (index) {
//         if (index == 1) {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (_) => const CasesScreen()),
//           );
//         }
//       },
//       items: const [
//         BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Home'),
//         BottomNavigationBarItem(icon: Icon(Icons.folder), label: 'Cases'),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.calendar_month),
//           label: 'Appointments',
//         ),
//         BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
//       ],
//     );
//   }
// }
