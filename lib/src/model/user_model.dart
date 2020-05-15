import 'package:flutter/foundation.dart';


class User {
  final String id;
  final String nombre;
  final String apellido;

  User({
    @required this.id,
    @required this.nombre,
    @required this.apellido,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      nombre: json['nombre'] as String,
      apellido: json['apellido'] as String,
    );
  }
}