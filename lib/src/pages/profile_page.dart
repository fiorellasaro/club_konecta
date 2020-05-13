import 'package:club_konecta/src/model/user_model.dart';
import 'package:club_konecta/src/pages/init_pages.dart';
import 'package:club_konecta/src/providers/user_provider.dart';

import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final HttpServiceUser httpService = HttpServiceUser();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mi Perfil"),
        backgroundColor: Color(0xff03DAC5),
      ),
      body: SingleChildScrollView(
        child: new Container(
          padding: new EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: new Column(
            children: <Widget>[
              FutureBuilder(
              future: httpService.getUsers(),
              builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
                if (snapshot.hasData) {
            List<User> user = snapshot.data;
            return ListView(
              children: user.map(
                (User user) => Container(
                  child: new Column(
                  children: <Widget>[
                    ListTile(
                    title: Text(user.name),
                    ),
              // getName(),
              // Center(
              //   child: GestureDetector(
              //     child: CircleAvatar(
              //       radius: 40,
              //       backgroundImage: AssetImage('assets/2.jpg'),
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 10.0),
              //   child: ListTile(
              //     title: Text(
              //       'Mis datos',
              //       style: TextStyle(
              //         fontFamily: 'Monserrate',
              //         fontSize: 16,
              //         fontWeight: FontWeight.bold,
              //         color: Color(0xff03DAC5),
              //       ),
              //     ),
              //   ),
              // ),
              // MyCustomForm()
                  ],
              ),
              ),
              ).toList(),
               );
              }
               return Center(child: CircularProgressIndicator(
            backgroundColor: Color(0xff03DAC5),
          ),);
              },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget getName() {
  final HttpServiceUser httpService = HttpServiceUser();
  return Expanded(
    // padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 70),
    child: FutureBuilder(
        future: httpService.getUsers(),
        builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
          if (snapshot.hasData) {
            List<User> user = snapshot.data;
            return ListView(
              children: user
                  .map(
                    (User user) => Card(
                        child: ListTile(
                          title: Center(
                            child: Text(user.name,
                              style: new TextStyle(
                                fontSize: 20.0,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          subtitle: Center(
                            child: Text(
                              'Lima, Perú ',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 14,
                                color: Color(0xff03DAC5),
                              ),
                            ),
                          ),
                        ),
                        ),
                  )
                  .toList(),
            );
          }
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Color(0xff03DAC5),
            ),
          );
        }),
  );
}

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Crea un widget Form usando el _formKey que creamos anteriormente
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Nombres y Apellidos'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'E-mail:'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Celular:'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Dirección Actual '),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text('Género'),
            ),
            GeneroStatefulWidget(),
            Text('¿Cuál de los equipos tienes en casa?'),
            EquipoStatefulWidget(),
            ListTile(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 15.0, horizontal: -10.0),
              leading: Icon(Icons.power_settings_new,
                  size: 25.0, color: Colors.teal[300]),
              title: Text("Cerrar sesión",
                  style: TextStyle(
                      decoration: TextDecoration.none, color: Colors.blue)),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => InitPages()),
                );
                print('tap avatar');
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Center(
                child: OutlineButton(
                  shape: StadiumBorder(),
                  textColor: Color(0xff837DFF),
                  child: Text('Editar perfil'),
                  borderSide: BorderSide(
                      color: Color(0xff837DFF),
                      style: BorderStyle.solid,
                      width: 1),
                  onPressed: () {},
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

enum GeneroCharacter { mujer, hombre }

class GeneroStatefulWidget extends StatefulWidget {
  GeneroStatefulWidget({Key key}) : super(key: key);
  @override
  _GeneroStatefulWidget createState() => _GeneroStatefulWidget();
}

class _GeneroStatefulWidget extends State<GeneroStatefulWidget> {
  GeneroCharacter _genero = GeneroCharacter.mujer;

  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        new Expanded(
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(vertical: -12.0),
            title: const Text('Femenino'),
            leading: Radio(
              activeColor: Colors.teal[200],
              value: GeneroCharacter.mujer,
              groupValue: _genero,
              onChanged: (GeneroCharacter value) {
                setState(() {
                  _genero = value;
                });
              },
            ),
          ),
        ),
        new Expanded(
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(vertical: -12.0),
            title: const Text('Masculino'),
            leading: Radio(
              activeColor: Colors.teal[200],
              value: GeneroCharacter.hombre,
              groupValue: _genero,
              onChanged: (GeneroCharacter value) {
                setState(() {
                  _genero = value;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}

class EquipoCheckbox extends StatelessWidget {
  const EquipoCheckbox({
    this.label,
    this.padding,
    this.value,
    this.onChanged,
  });

  final String label;
  final EdgeInsets padding;
  final bool value;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            Checkbox(
              value: value,
              onChanged: (bool newValue) {
                onChanged(newValue);
              },
              // checkColor: Colors.teal[200],  // color of tick Mark
              activeColor: Colors.teal[200],
            ),
            Expanded(child: Text(label)),
          ],
        ),
      ),
    );
  }
}

class EquipoStatefulWidget extends StatefulWidget {
  EquipoStatefulWidget({Key key}) : super(key: key);

  @override
  _EquipoStatefulWidget createState() => _EquipoStatefulWidget();
}

class _EquipoStatefulWidget extends State<EquipoStatefulWidget> {
  bool _isSelectedPC = false;
  bool _isSelectedLap = false;
  bool _isSelectedInternet = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        EquipoCheckbox(
          label: 'Computadora',
          padding: const EdgeInsets.symmetric(horizontal: 2.0),
          value: _isSelectedPC,
          onChanged: (bool newValue) {
            setState(() {
              _isSelectedPC = newValue;
            });
          },
        ),
        EquipoCheckbox(
          label: 'Laptop',
          padding: const EdgeInsets.symmetric(horizontal: 2.0),
          value: _isSelectedLap,
          onChanged: (bool newValue) {
            setState(() {
              _isSelectedLap = newValue;
            });
          },
        ),
        EquipoCheckbox(
          label: 'Internet',
          padding: const EdgeInsets.symmetric(horizontal: 2.0),
          value: _isSelectedInternet,
          onChanged: (bool newValue) {
            setState(() {
              _isSelectedInternet = newValue;
            });
          },
        ),
      ],
    );
  }
}
