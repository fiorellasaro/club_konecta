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
        ),
        body:new Container (
         padding: new EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
         child: 
        FutureBuilder(
        future: httpService.getEvents(),
        builder: (BuildContext context, AsyncSnapshot<List<Event>> snapshot) {
          if (snapshot.hasData) {
            List<Event> posts = snapshot.data;
            
            return ListView(

              children: posts
                  .map((Event post) =>
                  
                  Card(
                    child: new Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(vertical:20.0, horizontal: 10.0),
                          child: Text(post.title, style: TextStyle(
                            fontFamily: 'Monserrate',
                            fontSize: 16,
                            color: Colors.grey.shade700,
                          ),)
                          ),
                          FadeInImage(
                            placeholder: AssetImage('assets/original.gif'), 
                            image: NetworkImage('https://estaticos.elperiodico.com/resources/jpg/3/3/dia-madre-1554778597633.jpg'),
                            fadeInDuration: Duration(milliseconds: 200),
                            height: 300.0,
                            fit: BoxFit.cover,
                            ),
                         Container(
                          padding: EdgeInsets.symmetric(vertical:20.0, horizontal: 10.0),
                          child: Text(post.body, style: TextStyle(
                            fontFamily: 'Monserrate',
                            fontSize: 16,
                            color: Colors.grey.shade700,
                          ),)
                          ),
                          ]))
                      )
                  .toList(),
            );
           
          }
          return CircularProgressIndicator();
        },
      )
      )
    );
  }
}