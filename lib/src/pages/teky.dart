import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DisplaysWidget extends StatelessWidget {
  final Color color;
  DisplaysWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Container(
        // width: 300,
        // height: 400,
        child: Center(
          child: new InkWell(
            // child: new Text('Iniciar KAMU'),
            onTap: () =>
                launch('https://m.me/KonectaLab99'),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
              child: Center(
                child: Card(
                  child: Column(
                    children: <Widget>[
                      
                      Text(
                        'Iniciar Kami',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      
                      Image(image: AssetImage('assets/bot.png')),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
