import 'package:flutter/foundation.dart';

class User {
  final int id;
  final String name;
  final String email;
  final String phone;

  User({
    @required this.id,
    @required this.email,
    @required this.name,
    @required this.phone,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['Id'] as int,
      email: json['email'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
    );
  }
}