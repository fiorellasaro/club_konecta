import 'package:club_konecta/src/pages/events_page.dart';
import 'package:club_konecta/src/pages/init_pages.dart';
import 'package:club_konecta/src/pages/login_pages.dart';
import 'package:club_konecta/src/pages/home_page.dart';
import 'package:club_konecta/src/pages/reconocimiento_page.dart';
import 'package:club_konecta/src/pages/register_pages.dart';
import 'package:club_konecta/src/pages/congrats_page.dart';



import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getApplicationRoutes(){

  return <String, WidgetBuilder> {
        '/'               : (BuildContext context) => InitPages(),
        'login'               : (BuildContext context) => LoginPage(),
        'register'               : (BuildContext context) => RegisterPage(), 
        'congrats'               : (BuildContext context) => CongratsPage(),   
        'home'               : (BuildContext context) => HomePage(),
        'events'  : (BuildContext context) => EventPage(),
        'reconocimiento': (BuildContext context) => ReconocimientoDetail(),

};

}