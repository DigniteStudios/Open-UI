class RatingEntity {
  final double rate;
  final int count;

  RatingEntity({
    required this.rate,
    required this.count,
  });

  Map<String, dynamic> toJson() => {
    "rate": rate,
    "count": count,
  };
}