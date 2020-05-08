import 'package:flutter/material.dart';
import 'package:club_konecta/src/pages/login_pages.dart';

class InitPages extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: 
      Scaffold(
        backgroundColor: Color(0xff03DAC5),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 200,
                  child: new Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 4.0,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(35.0),
                        child: Image.asset(
                          'assets/1.png',
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    'CLUB',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Lito',
                      fontSize: 45,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  width: 250,
                  child: Image.asset('assets/2.png'),
                ),
                Container(
                  margin: EdgeInsets.only(top: 35),
                  width: 300,
                  child: RaisedButton(
                    padding: EdgeInsets.all(13.0),
                    textColor: Colors.white,
                    color: Color(0xff837DFF),
                    child: Text(
                      "Registrarme",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    onPressed: () {},
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  width: 300,
                  child: FlatButton(
                      padding: EdgeInsets.all(13.0),
                      child: new Text(
                        "Iniciar Sesión",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                          side: BorderSide(color: Colors.white))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
