import 'package:flutter/material.dart';


class DisplaysWidget extends StatelessWidget {

  final Color color;
  DisplaysWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}