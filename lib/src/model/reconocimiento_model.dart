import 'package:flutter/foundation.dart';

class Reconocimiento {
  final int id;
  final String fechaPublicacion;
  final String titulo;
  final String contenido;
  final String fechaEvento;
  final String multimedia;
  final String banner;

  Reconocimiento({
    @required this.id,
    @required this.titulo,
    @required this.fechaPublicacion,
    @required this.contenido,
    @required this.fechaEvento,
    @required this.multimedia,
    @required this.banner,
  });

  factory Reconocimiento.fromJson(Map<String, dynamic> json) {
    return Reconocimiento(
      id: json['Id'] as int,
      titulo: json['Titulo'] as String,
      fechaPublicacion: json['FechaPublicacion'] as String,
      contenido: json['Contenido'] as String,
      fechaEvento: json['FechaEvento'] as String,
      multimedia: json['Multimedia'] as String,
      banner: json['Banner'] as String,
    );
  }
}