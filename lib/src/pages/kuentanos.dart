import 'package:flutter/material.dart';

class KuentanosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: getListOfCards(),
        ),
      ),
    );
  }
}

Widget getHeader() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
    child: Text(
      'Comparte como te encuentras con nosotros',
      style: TextStyle(
        fontFamily: 'Monserrate',
        fontSize: 15,
        color: Colors.grey.shade700,
      ),
    ),
  );
}

List<Widget> getListOfCards() {
  List<Widget> listCards = List<Widget>();
  listCards.add(getHeader());
  for (int i = 0; i < 5; i++) {
    listCards.add(
      new Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
        child: Column(
          children: <Widget>[
            Image.asset(
              'assets/1.jpg',
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.link,
                  ),
                  Text(
                    'Encuesta de clima laboral 2020',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  return listCards;
}
