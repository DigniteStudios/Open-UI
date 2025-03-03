import '../../domain/entities/rating_entity.dart';

class Rating extends RatingEntity {
  Rating({
  double? rate,
  int? count
  }) : super(
    rate: rate ?? 0,
    count: count ?? 0,
  );

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
    rate: json["rate"]?.toDouble(),
    count: json["count"],
  );
}