// To parse this JSON data, do
//
//     final jewelleryModel = jewelleryModelFromJson(jsonString);

import 'dart:convert';

List<JewelleryModel> jewelleryModelFromJson(String str) =>
    List<JewelleryModel>.from(json
        .decode(str)
        .map((x) => JewelleryModel.fromJson(x as Map<String, dynamic>)));

String jewelleryModelToJson(dynamic data) =>
    json.encode(List<dynamic>.from(data.map<void>((x) => x.toJson())));

class JewelleryModel {
  factory JewelleryModel.fromJson(Map<String, dynamic> json) => JewelleryModel(
        id: json['id'] as int? ?? 0,
        title: json['title'] as String? ?? '',
        price: json['price'].toDouble(),
        description: json['description'] as String? ?? '',
        category: json['category'] as String? ?? '',
        image: json['image'] as String? ?? '',
        rating: Rating.fromJson(json['rating']),
      );
  JewelleryModel({
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

  Map<String, dynamic> toJson() => <String, dynamic>{
        'rate': rate,
        'count': count,
      };
}
