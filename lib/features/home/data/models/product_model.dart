// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';


import '../../domain/entities/product_entity.dart';
import 'rating_model.dart';

List<Product> productFromJson(List list) => List<Product>.from(list.map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product extends ProductEntity {
  Product({
    int? id,
    String? title,
    double? price,
    String? description,
    String? category,
    String? image,
    Rating? rating,
  }) : super(
    image: image ?? "",
    category: category ?? "",
    description: description ?? "",
    id: id ?? 0,
    price: price ?? 0.0,
    title: title ?? "",
    rating: rating ?? Rating()
  );

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    title: json["title"],
    price: json["price"]?.toDouble(),
    description: json["description"],
    category: json["category"],
    image: json["image"],
    rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
  );
}
