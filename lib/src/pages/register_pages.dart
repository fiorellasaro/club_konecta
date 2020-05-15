import 'package:club_konecta/src/providers/activate_account_provider.dart';
import 'package:flutter/material.dart';
import 'package:club_konecta/src/pages/congrats_page.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPage createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  final HttpServiceActivateAccount httpService = HttpServiceActivateAccount();

  GlobalKey<FormState> keyForm = new GlobalKey();
  TextEditingController dniCtrl = new TextEditingController();
  TextEditingController passwordCtrl = new TextEditingController();
  bool checkPassword = false;
  bool fieldClave = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xff03DAC5),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Text(
                      'Registrarme',
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

  Widget getButton() {
    return Container(
      width: 250,
      margin: EdgeInsets.only(top: 20),
      child: RaisedButton(
        padding: EdgeInsets.all(13.0),
        textColor: Colors.white,
        color: Color(0xff0752D8),
        child: Text(
          "Crear Cuenta",
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 15,
          ),
        ),
        onPressed: validateAndCreate,
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(30.0),
        ),
      ),
    );
  }

  void validateAndCreate() {
    final FormState form = keyForm.currentState;
    if (form.validate()) {
      Map data = {'dni': dniCtrl.text};
      httpService.activateAccount(data).then((value) => {
            print(value),
            print(data),
            // httpService.activateAccount().then((value) => {
            //       print(value),
            //       Navigator.push(context,
            //           MaterialPageRoute(builder: (context) => HomePage())),
            //     }),
          });

      if (fieldClave == false) {
        setState(() {
          showNotification();
          fieldClave = true;
        });
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => CongratsPage()));
      }
    }
  }

  void showNotification() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            elevation: 24.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(new Radius.circular(32.0)),
            ),
            content: Text(
              "Hola, se te enviará una clave al correo electrónico registrado en la compañia para poder activar tu cuenta.",
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.04),
            ),
          );
        });
  }

  Widget getTitle() {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Text(
        'Activar cuenta',
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
    if (fieldClave) {
      return AnimatedOpacity(
        opacity: 1.0,
        duration: Duration(milliseconds: 500),
        child: Container(
          margin: EdgeInsets.only(top: 35),
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Clave de registro:',
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
                validator: validatePassword,
                decoration: InputDecoration(
                  hintText: '*********',
                  contentPadding: EdgeInsets.all(10),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  String validatePassword(String value) {
    if (value.length == 0) return "Ingrese la contrasena";
    return null;
  }

  String validateDni(String value) {
    // String patttern = r'(^[0-9]*$)';
    // RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Ingrese el número de DNI";
    } else if (value.length != 8) {
      return "El DNI debe contener 8 digitos";
    }
    return null;
  }
}
