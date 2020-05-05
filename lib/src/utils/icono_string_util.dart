
import 'package:flutter/material.dart';

final _icons = <String, IconData>{

'home'    : Icons.home,
'favorite' : Icons.favorite,
'chat'   : Icons.chat,
'mood' : Icons.mood,
'public'   : Icons.public,

};

Icon getIcon(String nombreIcono){
  return Icon( _icons[nombreIcono], color: Colors.blue);
}