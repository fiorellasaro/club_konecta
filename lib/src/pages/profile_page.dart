import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mi Perfil"),
        backgroundColor: Color(0xff03DAC5),
      ),
      body: new Container(
        padding: new EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: new Column(
          children: <Widget>[
            getName(),
            Center(
              child: GestureDetector(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/2.jpg'),
                ),
              ),
            ),

           Padding(
             padding: const EdgeInsets.all(8.0),
             child: ListTile(
               title: Text('Mis datos',style: TextStyle(
                fontFamily: 'Monserrate',
                fontSize: 16,
                color: Color(0xff03DAC5),
                ),
              ),
               ),
           )
          ],
        ),
      ),
    );
  }
}

Widget getName() {
  return Container(
    // padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 70),
    child: ListTile(
      title: Center(
        child: Text(
          'Veronica',
          style: new TextStyle(
            fontSize: 17.0,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      subtitle: Center(child: Text('Lima, Perú ')),
    ),
  );
}
