import 'package:flutter/foundation.dart';

class News {
  final int userId;
  final int id;
  final String title;
  final String body;

  News({
    @required this.userId,
    @required this.id,
    @required this.title,
    @required this.body,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }
}
