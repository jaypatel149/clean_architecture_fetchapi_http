// To parse this JSON data, do
//
//     final electronicModel = electronicModelFromJson(jsonString);

import 'dart:convert';

List<ElectronicModel> electronicModelFromJson(String str) =>
    List<ElectronicModel>.from(json
        .decode(str)
        .map((x) => ElectronicModel.fromJson(x as Map<String, dynamic>)));

String electronicModelToJson(List<ElectronicModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ElectronicModel {
  factory ElectronicModel.fromJson(Map<String, dynamic> json) =>
      ElectronicModel(
        id: json['id'],
        title: json['title'],
        price: json['price'].toDouble(),
        description: json['description'],
        category: json['category'],
        image: json['image'],
        rating: Rating.fromJson(json['rating']),
      );
  ElectronicModel({
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
