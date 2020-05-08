import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Rating extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlutterRatingBar(
      initialRating: 0,
      itemSize: 30,
      fillColor: Colors.amber,
      borderColor: Colors.amber,
      allowHalfRating: true,
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }
}
