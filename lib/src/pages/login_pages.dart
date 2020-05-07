import 'package:flutter/material.dart';
import 'package:club_konecta/src/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  GlobalKey<FormState> keyForm = new GlobalKey();
  TextEditingController dniCtrl = new TextEditingController();
  TextEditingController passwordCtrl = new TextEditingController();
  bool _obscureText = true;
  bool checkPassword = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xff03DAC5),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 25),
                    height: 45,
                    child: Text(
                      'Iniciar sesión',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Montserrat',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1),
                    ),
                  ),
                  Container(
                    width: 340,
                    height: 450,
                    child: SingleChildScrollView(
                      child: Card(
                        child: Form(
                          key: keyForm,
                          child: Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: Column(
                              children: <Widget>[
                                getTitle(),
                                userField(),
                                userPassword(),
                                getCheckBox(),
                                getButton(),
                              ],
                            ),
                          ),
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

  Widget getCheckBox() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Checkbox(
          value: checkPassword,
          onChanged: (bool value) {
            setState(() {
              checkPassword = value;
            });
          },
        ),
        Text(
          'Olvidé mi contraseña',
          style: TextStyle(
              color: Color(0xff03DAC5),
              fontFamily: 'Roboto',
              fontSize: 12,
              letterSpacing: 0.04),
        ),
      ],
    );
  }

  Widget getButton() {
    return Container(
      width: 250,
      margin: EdgeInsets.only(top: 20),
      child: RaisedButton(
        padding: EdgeInsets.all(13.0),
        textColor: Colors.white,
        color: Color(0xff837DFF),
        child: Text(
          "Iniciar sesión",
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 15,
          ),
        ),
        onPressed: validateAndSave,
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(30.0),
        ),
      ),
    );
  }

  void validateAndSave() {
    final FormState form = keyForm.currentState;
    if (form.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      print('Form is invalid');
    }
  }

  Widget getTitle() {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Text(
        'Mi cuenta',
        style: TextStyle(
          color: Color(0xff03DAC5),
          fontFamily: 'Montserrat',
          fontSize: 18,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.4,
        ),
      ),
    );
  }

  Widget userField() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(bottom: 15),
            child: Text(
              'Ingrese su DNI',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.grey.shade400,
                fontFamily: 'Roboto',
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'DNI',
              style: TextStyle(
                color: Color(0xff2C2C54),
                fontFamily: 'Roboto',
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: '47372424',
              contentPadding: EdgeInsets.all(10),
            ),
            controller: dniCtrl,
            onSaved: (String value) {},
            validator: validateDni,
          ),
        ],
      ),
    );
  }

  Widget userPassword() {
    return Container(
      margin: EdgeInsets.only(top: 35),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'Contraseña',
              style: TextStyle(
                color: Color(0xff2C2C54),
                fontFamily: 'Roboto',
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TextFormField(
            controller: passwordCtrl,
            obscureText: _obscureText,
            validator: validatePassword,
            decoration: InputDecoration(
              hintText: '*********',
              contentPadding: EdgeInsets.all(10),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  String validatePassword(String value) {
    if (value.length == 0) return "Teclee su contrasena";
    return null;
  }

  String validateDni(String value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Teclee su DNI";
    } else if (value.length != 8) {
      return "El DNI debe contener 10 digitos";
    }
    return null;
  }
}
