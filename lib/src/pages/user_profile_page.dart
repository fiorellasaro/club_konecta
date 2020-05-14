import 'package:club_konecta/src/model/user_model.dart';
import 'package:club_konecta/src/pages/init_pages.dart';
import 'package:club_konecta/src/providers/user_provider.dart';

import 'package:flutter/material.dart';

class ProfileUser extends StatefulWidget {
  ProfileUser({Key key}) : super(key: key);

  @override
  _ProfileUserState createState() => _ProfileUserState();
}

enum GeneroCharacter { mujer, hombre }

class _ProfileUserState extends State<ProfileUser> {
  GlobalKey<FormState> keyForm = new GlobalKey();
  TextEditingController txtNombreCtrl = TextEditingController();
  TextEditingController txtEmailCtrl = TextEditingController();
  TextEditingController txtCelularCtrl= TextEditingController();
  TextEditingController txtDireccionCtrl= TextEditingController();

  bool _isEnabled = false;
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
                                  getName(),
                                  datosUserForm(),
                                  generoForm(),
                                  equiposTecnicos(),
                                  closeSession(),
                                  btnEditar(),
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

  Widget getName() {
    return Container(
      // padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 70),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Center(
              child: Text(
                'user.name',
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
          Center(
            child: GestureDetector(
              child: CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/2.jpg'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget datosUserForm() {
    // Crea un widget Form usando el _formKey que creamos anteriormente
    return Form(
      // key: _formKey,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              contentPadding: EdgeInsets.only(left: -10.0),
              title: Text(
                'Mis datos',
                style: TextStyle(
                  fontFamily: 'Monserrate',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff03DAC5),
                ),
              ),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Nombres y Apellidos'),
              controller: txtNombreCtrl,
              enabled: _isEnabled,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'E-mail:'),
              controller: txtEmailCtrl,
              enabled: _isEnabled,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Celular:'),
              controller: txtCelularCtrl,
              enabled: _isEnabled,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Dirección Actual '),
              controller: txtDireccionCtrl,
              enabled: _isEnabled,
            ),
          ],
        ),
      ),
    );
  }

  GeneroCharacter _genero = GeneroCharacter.mujer;
  Widget generoForm() {
    return Container(
      child: Column(
        children: <Widget>[
          ListTile(
              title: Text(
                'Género',
                style: TextStyle(
                  fontFamily: 'Monserrate',
                  fontSize: 12,
                  color: Color(0xff393939),
                ),
              ),
            ),
          Row(
            children: <Widget>[
              new Expanded(
                child: ListTile(
                  // contentPadding: EdgeInsets.symmetric(vertical: -12.0),
                  title: const Text('Femenino'),
                  leading: Radio(
                    activeColor: Colors.teal[200],
                    value: GeneroCharacter.mujer,
                    groupValue: _genero,
                    onChanged:_isEnabled ? (GeneroCharacter value) {
                      setState(() {
                        _genero = value;
                      });
                    } : null,
                  ),
                ),
              ),
              new Expanded(
                child: ListTile(
                  // contentPadding: EdgeInsets.symmetric(vertical: -12.0),
                  title: const Text('Masculino'),
                  leading: Radio(
                    activeColor: Colors.teal[200],
                    value: GeneroCharacter.hombre,
                    groupValue: _genero,
                    onChanged: _isEnabled ? (GeneroCharacter value) {
                      setState(() {
                        _genero = value;
                      });
                    } : null,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  bool _valuePC = false;
  bool _valueLaptop = false;
  bool _valueInternet = false;
  void _valuePCChanged(bool value) => setState(() => _valuePC = value);
  void _valueLaptopChanged(bool value) => setState(() => _valueLaptop = value);
  void _valueInternetChanged(bool value) => setState(() => _valueInternet = value);


  Widget equiposTecnicos() {
    return Center(
      child: new Column(
        children: <Widget>[
          ListTile(
              title: Text(
                '¿Cuál de los equipos tienes en casa?',
                style: TextStyle(
                  fontFamily: 'Monserrate',
                  fontSize: 12,
                ),
              ),
            ),
          // Text('¿Cuál de los equipos tienes en casa?'),
          new CheckboxListTile(
            value: _valuePC,
            onChanged: _isEnabled? _valuePCChanged : null,
            title: new Text('Computadora'),
            controlAffinity: ListTileControlAffinity.leading,
            activeColor: Colors.teal[200],
          ),
          new CheckboxListTile(
            value: _valueLaptop,
            onChanged: _isEnabled? _valueLaptopChanged : null,
            title: new Text('Laptop'),
            controlAffinity: ListTileControlAffinity.leading,
            activeColor: Colors.teal[200],
          ),
          new CheckboxListTile(
            value: _valueInternet,
            onChanged: _isEnabled? _valueInternetChanged : null,
            title: new Text('Internet'),
            controlAffinity: ListTileControlAffinity.leading,
            activeColor: Colors.teal[200],
          ),
        ],
      ),
    );
  }

  Widget closeSession() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: -10.0),
        leading:
            Icon(Icons.power_settings_new, size: 25.0, color: Colors.blue),
        title: Text("Cerrar sesión",
            style:
                TextStyle(decoration: TextDecoration.none, color: Colors.blue)),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => InitPages()),
          );
        },
      ),
    );
  }

  Widget btnEditar() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Center(
        child: OutlineButton(
          shape: StadiumBorder(),
          textColor: Color(0xff0752D8),
          onPressed: onChangedEdit,
              child: Text(_isEnabled ? "Guardar" : "Editar"),
          borderSide: BorderSide(
              color: Color(0xff0752D8), style: BorderStyle.solid, width: 1),
        ),
      ),
    );
  }

    onChangedEdit() {
    setState(() {
      _isEnabled = !_isEnabled;
    });
  }
}
