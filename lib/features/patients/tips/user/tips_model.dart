class TipsModel {
  final String photo;
  final String title;
  final String description;
  final String painName;
  final String advice;
  final String time;

  TipsModel({
    required this.photo,
    required this.title,
    required this.description,
    required this.painName,
    required this.advice,
    required this.time,
  });
}

List<TipsModel> tips = [
  TipsModel(
    photo:
        'assets/photo/—Pngtree—detailed human head anatomy with_20553138.png',
    title: 'The Importance of Hydration for Joint Health',
    description:
        'Learn how staying properly hydrated can lubricate your joints and reduce pain.',
    painName: 'Headache',
    advice:
        'Drink at least 8 glasses of water a day to keep your joints lubricated and reduce pain.',
    time: '4 min read',
  ),

  TipsModel(
    photo:
        'assets/photo/—Pngtree—detailed human head anatomy with_20553138.png',
    title: 'The Role of Exercise in Managing Joint Pain',
    description:
        'Discover how regular physical activity can strengthen muscles around joints and alleviate discomfort.',
    painName: 'Knee Pain',
    advice:
        'Engage in low-impact exercises like swimming or cycling to strengthen muscles around your joints and reduce pain.',
    time: '5 min read',
  ),

  TipsModel(
    photo:
        'assets/photo/—Pngtree—detailed human head anatomy with_20553138.png',
    title: 'Dietary Tips for Joint Health',
    description:
        'Explore foods rich in anti-inflammatory properties that can help reduce joint pain.',
    painName: 'Arthritis',
    advice:
        'Incorporate foods like fatty fish, nuts, and leafy greens into your diet to help reduce inflammation and joint pain.',
    time: '6 min read',
  ),
];
