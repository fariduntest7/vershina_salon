/// Мастер салона.
class Master {
  const Master({
    required this.id,
    required this.name,
    required this.specialization,
    required this.rating,
    required this.experienceYears,
    required this.isAvailable,
  });

  final String id;
  final String name;
  final String specialization;
  final double rating;
  final int experienceYears;
  final bool isAvailable;

  Master copyWith({
    String? id,
    String? name,
    String? specialization,
    double? rating,
    int? experienceYears,
    bool? isAvailable,
  }) {
    return Master(
      id: id ?? this.id,
      name: name ?? this.name,
      specialization: specialization ?? this.specialization,
      rating: rating ?? this.rating,
      experienceYears: experienceYears ?? this.experienceYears,
      isAvailable: isAvailable ?? this.isAvailable,
    );
  }
}
