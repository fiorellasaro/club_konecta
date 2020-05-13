import 'package:club_konecta/src/model/user_model.dart';
import 'package:club_konecta/src/providers/user_provider.dart';

import 'package:flutter/material.dart';

class UserProfilePage extends StatelessWidget {
  final HttpServiceUser httpService = HttpServiceUser();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mi Perfil"),
        backgroundColor: Color(0xff03DAC5),
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            Expanded(
              child: FutureBuilder(
                future: httpService.getUsers(),
                builder:
                    (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
                  if (snapshot.hasData) {
                    List<User> users = snapshot.data;
                    return ListView(
                      children: users
                          .map(
                            (User user) => Container(
                              child: new Column(
                                children: <Widget>[
                                  ListTile(
                                    title: Text(user.name),
                                    // subtitle: Text("${user.userId}"),
                                  ),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
