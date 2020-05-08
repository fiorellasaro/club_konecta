import 'package:flutter/material.dart';
import 'package:club_konecta/src/pages/login_pages.dart';

class InitPages extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/1.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(35.0),
                    child: Image.asset(
                      'assets/2.png',
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 35),
                    width: 300,
                    child: RaisedButton(
                      padding: EdgeInsets.all(13.0),
                      textColor: Colors.white,
                      color: Color(0xff0752D8),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Registrarme',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    width: 300,
                    child: FlatButton(
                      padding: EdgeInsets.all(13.0),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                      child: Text(
                        "Iniciar sesión",
                        style: TextStyle(
                          color: Color(0xff0752D8),
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    }
    }