// To parse this JSON data, do
//
//     final menClothModel = menClothModelFromJson(jsonString);

import 'dart:convert';

List<MenClothModel> menClothModelFromJson(String str) =>
    List<MenClothModel>.from(json
        .decode(str)
        .map((x) => MenClothModel.fromJson(x as Map<String, dynamic>)));

String menClothModelToJson(List<MenClothModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MenClothModel {
  factory MenClothModel.fromJson(Map<String, dynamic> json) => MenClothModel(
        id: json['id'] as int? ?? 0,
        title: json['title'] as String? ?? '',
        price: json['price'].toDouble(),
        description: json['description'] as String? ?? '',
        category: json['category'] as String? ?? '',
        image: json['image'] as String? ?? '',
        rating: Rating.fromJson(json['rating']),
      );
  MenClothModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'price': price,
        'description': description,
        'category': category,
        'image': image,
        'rating': rating!.toJson(),
      };
}

class Rating {
  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: json['rate'].toDouble(),
        count: json['count'],
      );
  Rating({
    this.rate,
    this.count,
  });

  double? rate;
  int? count;

  Map<String, dynamic> toJson() => {
        'rate': rate,
        'count': count,
      };
}
