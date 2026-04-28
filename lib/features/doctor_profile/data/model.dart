class AppointmentData {
  final String photoUrl;
  final String patientName;
  final String description;
  final String time;
  final String day;

  AppointmentData({
    required this.photoUrl,
    required this.patientName,
    required this.description,
    required this.time,
    required this.day,
  });
}

final List<AppointmentData> appointments = [
  AppointmentData(
    photoUrl: 'https://via.placeholder.com/150',
    patientName: 'John Doe',
    description: 'Follow-up consultation for skin treatment progress.',
    time: '10:30 AM',
    day: 'Monday',
  ),
  AppointmentData(
    photoUrl: 'https://via.placeholder.com/150',
    patientName: 'Jane Smith',
    description: 'Initial appointment to discuss symptoms and diagnosis.',
    time: '1:15 PM',
    day: 'Tuesday',
  ),
  AppointmentData(
    photoUrl: 'https://via.placeholder.com/150',
    patientName: 'Michael Johnson',
    description: 'Routine check-up and medication review.',
    time: '3:00 PM',
    day: 'Wednesday',
  ),
  AppointmentData(
    photoUrl: 'https://via.placeholder.com/150',
    patientName: 'Emily Davis',
    description: 'Consultation for new skin condition and treatment options.',
    time: '11:00 AM',
    day: 'Thursday',
  ),
  AppointmentData(
    photoUrl: 'https://via.placeholder.com/150',
    patientName: 'David Wilson',
    description: 'Follow-up appointment to assess treatment effectiveness.',
    time: '2:45 PM',
    day: 'Friday',
  ),
  AppointmentData(
    photoUrl: 'https://via.placeholder.com/150',
    patientName: 'Sarah Brown',
    description: 'Initial consultation for skin allergy symptoms.',
    time: '9:30 AM',
    day: 'Monday',
  ),
  AppointmentData(
    photoUrl: 'https://via.placeholder.com/150',
    patientName: 'Chris Lee',
    description: 'Routine check-up and skin health assessment.',
    time: '4:00 PM',
    day: 'Tuesday',
  ),
  // Add more appointment data as needed
  AppointmentData(
    photoUrl: 'https://via.placeholder.com/150',
    patientName: 'Jessica Taylor',
    description: 'Consultation for acne treatment and skincare routine.',
    time: '12:00 PM',
    day: 'Wednesday',
  ),
  AppointmentData(
    photoUrl: 'https://via.placeholder.com/150',
    patientName: 'Daniel Anderson',
    description: 'Follow-up appointment for eczema management.',
    time: '3:30 PM',
    day: 'Thursday',
  ),
];
