import 'package:bodycare_ai/pages/petiant_pages/body_diagram.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class DashBoardPage extends StatelessWidget {
  const DashBoardPage({super.key});

  static const Color background = Color(0xFFF3F7F5);
  static const Color primaryGreen = Color(0xFF2F9D82); // اللون الأخضر الأساسي
  static const Color darkText = Color(0xFF263238);
  static const Color mutedText = Color(0xFF6D7375);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Column(
          children: [
            // Top area (avatar + greeting + small icons)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
              child: Row(
                children: [
                  // avatar
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage(
                      'assets/avatar.jpg',
                    ), // ضع صورة هنا أو استخدم NetworkImage
                    // backgroundColor: Colors.grey[300],
                  ),
                  const SizedBox(width: 12),
                  // greeting
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Hello,',
                          style: TextStyle(color: mutedText, fontSize: 13),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'Maria 👋',
                          style: TextStyle(
                            color: darkText,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // small icons (calendar / notifications)
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.calendar_today_outlined),
                    color: Colors.black54,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notifications_outlined),
                    color: Colors.black54,
                  ),
                ],
              ),
            ),

            // content scroll area
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 6,
                ),
                child: Column(
                  children: [
                    // --- Big green card with body image + text + small white card below (floating)
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        // Main green card
                        Container(
                          width: double.infinity,
                          height: 190,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF2F9D82), Color(0xFF48B994)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.08),
                                blurRadius: 18,
                                offset: const Offset(0, 8),
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 110,
                                height: 160,
                                alignment: Alignment.center,
                                child: Opacity(
                                  opacity: 0.95,
                                  child: Image.asset('assets/photo/body.png'),
                                ),
                              ),

                              const SizedBox(width: 66),

                              // right: text and button
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Tap here to\nstart your 3D\ndiagnosis.',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      height: 1.08,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Get.to(BodyDiagram());
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        foregroundColor: primaryGreen,
                                        elevation: 2,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 14,
                                          vertical: 8,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                        textStyle: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      child: const Text('Start Now'),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        // Floating small white card under the green card (Feeling discomfort)
                        Positioned(
                          bottom: -60,
                          left: 8,
                          right: 8,
                          child: Material(
                            elevation: 6,
                            borderRadius: BorderRadius.circular(14),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 12,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          'Feeling discomfort?',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            color: darkText,
                                          ),
                                        ),
                                        SizedBox(height: 6),
                                        Text(
                                          'Start a new diagnosis now.',
                                          style: TextStyle(
                                            color: mutedText,
                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: primaryGreen,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 14,
                                        vertical: 10,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    child: const Text(
                                      'Start Now',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 77,
                    ), // space because of floating card
                    // Recent Sessions header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Recent Sessions',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          'View All',
                          style: TextStyle(
                            color: primaryGreen,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    // List of sessions (example)
                    Column(
                      children: [
                        _sessionItem(
                          title: 'Left Knee Pain',
                          date: 'Aug 19, 2024',
                          status: 'Completed',
                        ),
                        const SizedBox(height: 10),
                        _sessionItem(
                          title: 'Lower Back Pain',
                          date: 'Aug 14, 2024',
                          status: 'Completed',
                        ),
                        const SizedBox(height: 10),
                        _sessionItem(
                          title: 'Right Shoulder Pain',
                          date: 'Jul 30, 2024',
                          status: 'Completed',
                        ),
                      ],
                    ),

                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),

            // Bottom navigation (simple)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              color: background,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _navItem(
                    icon: Icons.dashboard,
                    label: 'Dashboard',
                    active: true,
                  ),
                  _navItem(
                    icon: Icons.medical_services_outlined,
                    label: 'Doctors',
                  ),
                  _navItem(icon: Icons.lightbulb_outline, label: 'Tips'),
                  _navItem(icon: Icons.person_outline, label: 'Profile'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // helper for session item
  Widget _sessionItem({
    required String title,
    required String date,
    required String status,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          // small icon circle
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: primaryGreen.withOpacity(0.12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.healing_outlined, color: primaryGreen),
          ),
          const SizedBox(width: 12),
          // title + date
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 6),
                Text(date, style: const TextStyle(color: mutedText)),
              ],
            ),
          ),
          // status pill
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.12),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              status,
              style: const TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // helper for nav item
  Widget _navItem({
    required IconData icon,
    required String label,
    bool active = false,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: active ? primaryGreen : Colors.black54),
        const SizedBox(height: 6),
        Text(
          label,
          style: TextStyle(
            color: active ? primaryGreen : Colors.black54,
            fontSize: 12,
            fontWeight: active ? FontWeight.w700 : FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
