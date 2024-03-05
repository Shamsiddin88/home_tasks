import 'package:flutter/material.dart';
import 'package:home_tasks/utils/project_extensions.dart';

class ProductModel {
  ProductModel({required this.color,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.productName,
    required this.dateTime,
    required this.productId});

  final String productName;
  final String description;
  final String imageUrl;
  final Color color;
  final double price;
  final String productId;
  final DateTime dateTime;

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        color: (json["color"] as String? ?? "FFFFFF").toColor(),
        description: json["description"] as String? ?? "",
        price: (json["price"] as num? ?? 0.0).toDouble(),
        imageUrl: json["Image_url"] as String? ?? "",
        productName: json["product_name"] as String? ?? "",
        dateTime: DateTime.fromMillisecondsSinceEpoch(
            (json["_created"] as num).toInt() * 1000),
        productId: json["_uuid"] as String? ?? "");
  }

  static ProductModel initialValue = ProductModel(
      color: Colors.white,
      description: "",
      price: 0.0,
      imageUrl: "",
      productName: "",
      dateTime: DateTime.now(),
      productId: "");


ProductModel copyWith({
  String? productName,
  String? description,
  String? imageUrl,
  Color? color,
  double? price,
  String? productId,
  DateTime? dateTime,
}) {
  return ProductModel(
      productName: productName ?? this.productName,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      color: color ?? this.color,
      price: price ?? this.price,
      productId: productId ?? this.productId,
      dateTime: dateTime ?? this.dateTime
  );
}

Map<String, dynamic> toJson() {
  return {
    "product_name": productName,
    "price": price,
    "description": description,
    "color": "FF0000",
    "Image_url": imageUrl
  };
}

Map<String, dynamic> toJsonForUpdate() {
  return {
    "product_name": productName,
    "price": price,
    "description": description,
    "color": "FF0000",
    "Image_url": imageUrl,
    "_uuid": productId,
  };
}

  bool canAddModel() {
    if (productName.isEmpty) return false;
    if (description.isEmpty) return false;
    if (imageUrl.isEmpty) return false;
    if (price == 0) return false;
    return true;
  }
}
