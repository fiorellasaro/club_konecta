import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:club_konecta/src/model/events_model.dart';
import 'package:club_konecta/src/providers/events_provider.dart';
import 'package:flutter/material.dart';


class EventsDetailsPage extends StatelessWidget {

  final HttpServiceEvents httpService = HttpServiceEvents();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("Eventos"),
        backgroundColor: Color(0xff03DAC5),
        ),
        
        body:new Container (
         padding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        child: new Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            ListTile(
              leading:
                Icon(MdiIcons.partyPopper, size: 30.0, color: Colors.teal[300]),
              title: Text(
                'Eventos',
                style: TextStyle(
                  fontFamily: 'Monserrate',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        Expanded(
        child: FutureBuilder(
        future: httpService.getEvents(),
        builder: (BuildContext context, AsyncSnapshot<List<Event>> snapshot) {
          if (snapshot.hasData) {
            List<Event> event = snapshot.data;
            return ListView(
              children: event
                  .map((Event event) =>
                  Card(
                    child: new Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(vertical:20.0, horizontal: 10.0),
                          child: Text(event.titulo, style: TextStyle(
                            fontFamily: 'Monserrate',
                            fontSize: 18,
                          ),),
                          ),
                          FadeInImage(
                            placeholder: AssetImage('assets/original.gif'), 
                            image: NetworkImage(event.banner),
                            fadeInDuration: Duration(milliseconds: 200),
                            height: 300.0,
                            fit: BoxFit.cover,
                            ),
                           
                          Container(
                          padding: EdgeInsets.symmetric(vertical:20.0, horizontal: 10.0),
                          child: Text(event.contenido, style: TextStyle(
                            fontFamily: 'Monserrate',
                            fontSize: 17,
                          ),
                          textAlign: TextAlign.justify,
                          ),
                          ),
                          ],),),
                      )
                  .toList(),
            );
           
          }
          return Center(child: CircularProgressIndicator(
            backgroundColor: Color(0xff03DAC5),
          ),);
        },
      ),
      ),
      ],
      ),
    ),
      
    );
  }
}