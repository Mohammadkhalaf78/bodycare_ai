class PatientModel {
  final String name;
  final String caseId;
  final String time;
  final String status;
  final String statusColorType;

  const PatientModel({
    required this.name,
    required this.caseId,
    required this.time,
    required this.status,
    required this.statusColorType,
  });
}

List<PatientModel> patients = [
  PatientModel(
    name: 'John D.',
    caseId: '#BC-12345',
    time: 'Today, 9:41 AM',
    status: 'New',
    statusColorType: 'new',
  ),
  PatientModel(
    name: 'Emily R.',
    caseId: '#BC-12344',
    time: 'Yesterday, 3:15 PM',
    status: 'In Review',
    statusColorType: 'review',
  ),
  PatientModel(
    name: 'Michael B.',
    caseId: '#BC-12343',
    time: '2 days ago',
    status: 'Completed',
    statusColorType: 'done',
  ),
  PatientModel(
    name: 'Sarah L.',
    caseId: '#BC-12342',
    time: '3 days ago',
    status: 'New',
    statusColorType: 'new',
  ),
  PatientModel(
    name: 'David W.',
    caseId: '#BC-12341',
    time: '4 days ago', 
    status: 'In Review',
    statusColorType: 'review',
  ),
  PatientModel(
    name: 'Jessica M.',
    caseId: '#BC-12340',
    time: '5 days ago',
    status: 'Completed',
    statusColorType: 'done',
  ),
  PatientModel(
    name: 'Daniel S.',
    caseId: '#BC-12339',
    time: '6 days ago',
    status: 'New',
    statusColorType: 'new',
  ),
      
];