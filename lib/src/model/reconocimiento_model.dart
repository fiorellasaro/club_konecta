import 'package:flutter/foundation.dart';

class Reconocimiento {
  final int userId;
  final int id;
  final String title;
  final String body;

  Reconocimiento({
    @required this.userId,
    @required this.id,
    @required this.title,
    @required this.body,
  });

  factory Reconocimiento.fromJson(Map<String, dynamic> json) {
    return Reconocimiento(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }
}