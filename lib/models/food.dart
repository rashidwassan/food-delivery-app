import 'dart:convert';

import 'package:flutter/material.dart';

@immutable
class Food {
  final String id;
  final String title;
  final String imageUrl;
  final String description;
  final String category;
  final int price;
  final int previousPrice;
  final int createdAt;
  final int updatedAt;
  final bool isLive;
  final Map<String, dynamic> createdBy;
  final List<String> ingridients;

  const Food({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.category,
    required this.price,
    required this.previousPrice,
    required this.createdAt,
    required this.updatedAt,
    required this.isLive,
    required this.createdBy,
    required this.ingridients,
  });

  Food copyWith({
    String? id,
    String? title,
    String? imageUrl,
    String? description,
    String? category,
    int? price,
    int? previousPrice,
    int? createdAt,
    int? updatedAt,
    bool? isLive,
    Map<String, dynamic>? createdBy,
    List<String>? ingridients,
  }) {
    return Food(
      id: id ?? this.id,
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      description: description ?? this.description,
      category: category ?? this.category,
      price: price ?? this.price,
      previousPrice: previousPrice ?? this.previousPrice,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isLive: isLive ?? this.isLive,
      createdBy: createdBy ?? this.createdBy,
      ingridients: ingridients ?? this.ingridients,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'imageUrl': imageUrl,
      'description': description,
      'category': category,
      'price': price,
      'previousPrice': previousPrice,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'isLive': isLive,
      'createdBy': createdBy,
      'ingridients': ingridients,
    };
  }

  factory Food.fromMap(Map<String, dynamic> map) {
    return Food(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      description: map['description'] ?? '',
      category: map['category'] ?? '',
      price: map['price'] ?? 0,
      previousPrice: map['previousPrice'] ?? 0,
      createdAt: map['createdAt'] ?? 0,
      updatedAt: map['updatedAt'] ?? 0,
      isLive: map['isLive'] ?? false,
      createdBy: Map<String, dynamic>.from(map['createdBy']),
      ingridients: List<String>.from(map['ingridients']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Food.fromJson(String source) => Food.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Food(id: $id, title: $title, imageUrl: $imageUrl, description: $description, category: $category, price: $price, previousPrice: $previousPrice, createdAt: $createdAt, updatedAt: $updatedAt, isLive: $isLive, createdBy: $createdBy, ingridients: $ingridients)';
  }

  List<Object> get props {
    return [
      id,
      title,
      imageUrl,
      description,
      category,
      price,
      previousPrice,
      createdAt,
      updatedAt,
      isLive,
      createdBy,
      ingridients,
    ];
  }
}
