import 'package:flutter/material.dart';
import 'package:club_konecta/src/pages/home_page.dart';

class CongratsPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xff03DAC5),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                alignment: Alignment.topRight,
                child: FlatButton(
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  shape: CircleBorder(
                    side: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 80, right: 80, bottom: 20),
                      child: Image.asset('assets/happy.png'),
                    ),
                    Text(
                      '¡Cuenta creada!',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        color: Color(0xff0752D8),
                        fontSize: 24,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(
                        '¡Felicidades! Ahora podrás \n disfrutar \n\n de todos los beneficios del \n CLUB Konecta',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
