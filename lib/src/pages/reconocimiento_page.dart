import 'package:flutter/material.dart';

class ReconocimientoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Reconocimientos ')
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.keyboard_arrow_right),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
    );
  }
}