import 'package:club_konecta/src/model/reconocimiento_model.dart';
import 'package:club_konecta/src/providers/reconocimiento_provider.dart';
import 'package:flutter/material.dart';

class ReconocimientoDetail extends StatelessWidget {
  final Reconocimiento reconocimiento;
  final HttpService httpService = HttpService();

  ReconocimientoDetail({
    @required this.reconocimiento,
  });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(reconocimiento.title),
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Card(
              child: Column(
            children: <Widget>[
              ListTile(
                title: Text("Title"),
                subtitle: Text(reconocimiento.title),
              ),
              ListTile(
                title: Text("ID"),
                subtitle: Text("${reconocimiento.id}"),
              ),
              ListTile(
                title: Text("Body"),
                subtitle: Text(reconocimiento.body),
              ),
              ListTile(
                title: Text("User ID"),
                subtitle: Text("${reconocimiento.userId}"),
              ),
            ],
          )),
        )));
  }
}