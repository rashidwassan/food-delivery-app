import 'dart:convert';
import 'package:flutter/material.dart';

const String ADMIN_PERMISSION = "admin";
const String CUSTOMER_PERMISSION = "customer";

@immutable
class SFUser {
  final String uid;
  final String email;
  final String name;
  final String phone;
  final String profileImageUrl;
  final int createdAt;
  final int updatedAt;
  final bool isActive;
  final int dob;
  final int points;
  final List<String> permisions;
  final List<String> favorites;

  bool get isAdmin => permisions.contains(ADMIN_PERMISSION);

  const SFUser({
    required this.uid,
    required this.email,
    required this.name,
    required this.phone,
    required this.profileImageUrl,
    required this.createdAt,
    required this.updatedAt,
    required this.isActive,
    required this.dob,
    required this.points,
    required this.permisions,
    required this.favorites,
  });

  List<Object> get props {
    return [
      uid,
      email,
      name,
      phone,
      profileImageUrl,
      createdAt,
      updatedAt,
      isActive,
      dob,
      points,
      permisions,
      favorites,
    ];
  }

  SFUser copyWith({
    String? uid,
    String? email,
    String? name,
    String? phone,
    String? profileImageUrl,
    int? createdAt,
    int? updatedAt,
    bool? isActive,
    int? dob,
    int? points,
    List<String>? permisions,
    List<String>? favorites,
  }) {
    return SFUser(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isActive: isActive ?? this.isActive,
      dob: dob ?? this.dob,
      points: points ?? this.points,
      permisions: permisions ?? this.permisions,
      favorites: favorites ?? this.favorites,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'phone': phone,
      'profileImageUrl': profileImageUrl,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'isActive': isActive,
      'dob': dob,
      'points': points,
      'permisions': permisions,
      'favorites': favorites,
    };
  }

  factory SFUser.fromMap(Map<String, dynamic> map) {
    return SFUser(
      uid: map['uid'] ?? '',
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      phone: map['phone'] ?? '',
      profileImageUrl: map['profileImageUrl'] ?? '',
      createdAt: map['createdAt'] ?? 0,
      updatedAt: map['updatedAt'] ?? 0,
      isActive: map['isActive'] ?? false,
      dob: map['dob'] ?? 0,
      points: map['points'] ?? 0,
      permisions: List<String>.from(map['permisions'] ?? []),
      favorites: List<String>.from(map['favorites'] ?? []),
    );
  }

  String toJson() => json.encode(toMap());

  factory SFUser.fromJson(String source) => SFUser.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(uid: $uid, email: $email, name: $name, phone: $phone, profileImageUrl: $profileImageUrl, createdAt: $createdAt, updatedAt: $updatedAt, isActive: $isActive, points: $points, dob: $dob, permisions: $permisions, favorites: $favorites)';
  }
}
