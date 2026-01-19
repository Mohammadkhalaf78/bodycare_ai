class DoctorModel {
  final String imageUrl;
  final String name;
  final String specialty;
  final double rating;
  final int reviewsCount;
  final String distance;

  DoctorModel({
    required this.imageUrl,
    required this.name,
    required this.specialty,
    required this.rating,
    required this.reviewsCount,
    required this.distance,
  });
}
