// To parse this JSON data, do
//
//     final myDataModel = myDataModelFromJson(jsonString);

import 'dart:convert';

MyDataModel myDataModelFromJson(String str) =>
    MyDataModel.fromJson(json.decode(str));

String myDataModelToJson(MyDataModel data) => json.encode(data.toJson());

class MyDataModel {
  factory MyDataModel.fromJson(Map<String, dynamic> json) => MyDataModel(
        id: json['id'] as int? ?? 0,
        title: json['title'] as String? ?? '',
        price: json['price'].toDouble(),
        description: json['description'] as String? ?? '',
        category: json['category'] as String? ?? '',
        image: json['image'] as String? ?? '',
        rating: Rating.fromJson(json['rating']),
      );
  MyDataModel({
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
  Rating({
    this.rate,
    this.count,
  });

  double? rate;
  int? count;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: json['rate'].toDouble(),
        count: json['count'],
      );

  Map<String, dynamic> toJson() => {
        'rate': rate,
        'count': count,
      };
}
