// To parse this JSON data, do
//
//     final dummyModel = dummyModelFromJson(jsonString);

// ignore_for_file: constant_identifier_names

import 'dart:convert';

List<DummyModel> dummyModelFromJson(String str) => List<DummyModel>.from(json
    .decode(str)
    .map((x) => DummyModel.fromJson(x as Map<String, dynamic>)));

String dummyModelToJson(List<DummyModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DummyModel {
  factory DummyModel.fromJson(Map<String, dynamic> json) => DummyModel(
        id: json['id'] as int? ?? 1,
        title: json['title'] as String? ?? '',
        price: json['price'].toDouble(),
        description: json['description'] as String? ?? '',
        category: categoryValues.map![json['category'] as String? ?? ''],
        image: json['image'],
        rating: Rating.fromJson(json['rating']),
      );
  DummyModel({
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
  Category? category;
  String? image;
  Rating? rating;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'price': price,
        'description': description,
        'category': categoryValues.reverse![category],
        'image': image,
        'rating': rating!.toJson(),
      };
}

enum Category { MEN_S_CLOTHING, JEWELERY, ELECTRONICS, WOMEN_S_CLOTHING }

final categoryValues = EnumValues({
  'electronics': Category.ELECTRONICS,
  'jewelery': Category.JEWELERY,
  "men's clothing": Category.MEN_S_CLOTHING,
  "women's clothing": Category.WOMEN_S_CLOTHING
});

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

class EnumValues<T> {
  EnumValues(this.map);
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  Map<T, String>? get reverse {
    reverseMap ??= map!.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
