import 'package:club_konecta/src/pages/events_page.dart';
import 'package:club_konecta/src/pages/home_page.dart';


import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getApplicationRoutes(){

  return <String, WidgetBuilder> {
        '/'               : (BuildContext context) => HomePage(),

        'events'  : (BuildContext context) => EventoPage(),
        
};

}