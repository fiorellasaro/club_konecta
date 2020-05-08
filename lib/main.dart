
import 'package:flutter/material.dart';
import 'package:club_konecta/src/pages/init_pages.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componentes App',
      debugShowCheckedModeBanner: false,
      home: InitPages(),
    );
  }
}