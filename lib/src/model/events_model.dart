import 'package:flutter/foundation.dart';

class Event {
  final int userId;
  final int id;
  final String title;
  final String body;

  Event({
    @required this.userId,
    @required this.id,
    @required this.title,
    @required this.body,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }
}