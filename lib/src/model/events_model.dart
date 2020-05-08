import 'package:flutter/foundation.dart';

class Event {
  final int id;
  final String fechaPublicacion;
  final String titulo;
  final String contenido;
  final String fechaEvento;
  final String banner;
  Event({
    @required this.id,
    @required this.titulo,
    @required this.fechaPublicacion,
    @required this.contenido,
    @required this.fechaEvento,
    @required this.banner,
  });
  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['Id'] as int,
      titulo: json['Titulo'] as String,
      fechaPublicacion: json['FechaPublicacion'] as String,
      contenido: json['Contenido'] as String,
      fechaEvento: json['FechaEvento'] as String,
      banner: json['Banner'] as String,
    );
  }
}