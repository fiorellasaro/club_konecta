import 'package:flutter/foundation.dart';

class Kuentanos {
  final String title;
  final String img;
  final String url;

  Kuentanos({
    @required this.title,
    @required this.img,
    @required this.url,
  });

  factory Kuentanos.fromJson(Map<String, dynamic> json) {
    return Kuentanos(
      title: json['Titulo'] as String,
      img: json['Banner'] as String,
      url: json['link'] as String,
    );
  }
}