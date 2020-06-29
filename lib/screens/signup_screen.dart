import 'package:app_login_ui/User/bloc/bloc_user.dart';
import 'package:app_login_ui/widgets/text_input.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import './get_cities.dart';
import 'package:app_login_ui/widgets/button_green.dart';
import 'package:app_login_ui/User/screens/landing_screen.dart';
import 'package:app_login_ui/User/model/user.dart';

class SignupScreen extends StatefulWidget {
  static const routeName = '/signup';

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String value = 'cero';
  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);

    return _handleCurrentSession();
  }

  Widget _handleCurrentSession() {
    return StreamBuilder(
        stream: userBloc.authStatus,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          //snashot-data-object-user
          if (!snapshot.hasData || snapshot.hasError) {
            return registerPrincipalScreen();
          } else {
            return LandingScreen();
          }
        });
  }

  Widget registerPrincipalScreen() {
    final _controllerNameUser = TextEditingController();
    final _controllerEmailUser = TextEditingController();
    final _controllerPasswordUser = TextEditingController();
    bool _AfterFirstEntryToText;
    bool _validateName = false;
    bool _validateEmail = false;
    bool _validatePassword = false;
    print(_AfterFirstEntryToText);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        // title: Text('Login'),
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
            color: Colors.white,
            width: double.infinity,
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Image.asset(
                      'assets/images/logo.png',
                      height: 100,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Ingresa tus datos para continuar',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 30,
                          color: Color(0xff1d976c),
                          fontFamily: 'Monserrat',
                          fontStyle: FontStyle.normal),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextInput(
                      hintText: "email",
                      inputType: null,
                      controller: _controllerEmailUser,
                      obscureHidden: false,
                      iconData: Icons.alternate_email,
                      validate: _validateEmail,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextInput(
                      hintText: "Nombre Completo",
                      inputType: null,
                      controller: _controllerNameUser,
                      obscureHidden: false,
                      iconData: Icons.accessibility,
                      validate: _validateName,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextInput(
                      hintText: "Contraseña",
                      inputType: null,
                      controller: _controllerPasswordUser,
                      iconData: Icons.security,
                      obscureHidden: true,
                      validate: _validatePassword,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    FlatButton(
                      color: Color(0xff1d976c),
                      child: Text(
                        'Registro',
                        style: TextStyle(
                          fontFamily: 'Monserrat',
                          fontStyle: FontStyle.normal,
                          fontSize: 20,
                        ),
                      ),
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      padding: const EdgeInsets.all(15),
                      textColor: Colors.white,
                      onPressed: () {
                        _AfterFirstEntryToText = true;
                        _validateName = _controllerNameUser.text.isEmpty;
                        _validateEmail = _controllerEmailUser.text.isEmpty;
                        _validatePassword =
                            _controllerPasswordUser.text.isEmpty;
                        if (_validateEmail |
                            _validateName |
                            _validatePassword) {
                          print("esta vacio los campos   ${_validateEmail}");
                        } else {
                          userBloc.signOut(); //Force closed
                          //thesession by flutter bug
                          userBloc
                              .signUp(_controllerEmailUser.text,
                                  _controllerPasswordUser.text)
                              .then((FirebaseUser user) {
                            print("el usuario es ${_controllerNameUser.text}");
                            userBloc.updateUserData(User(
                                uid: user.uid,
                                name: _controllerNameUser.text,
                                password: _controllerPasswordUser.text,
                                email: _controllerEmailUser.text));
                          });
                        }
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ButtonGreen(
                      text: 'Registro con Gmail',
                      onPressed: () {
                        userBloc.signOut(); //Force closed
                        //thesession by flutter bug
                        userBloc.signIn().then((FirebaseUser user) {
                          print("el usuario es ${user.displayName}");
                          userBloc.updateUserData(User(
                              uid: user.uid,
                              name: user.displayName,
                              password: '***Logged with gmail***',
                              email: user.email,
                              photoURL: user.photoUrl));
                        });
                      },
                      height: 50.0,
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _listaCiudades() {
    //citiesProvider.getCities().then((value) => print(value));
    return FutureBuilder(
      future: citiesProvider.getCities(),
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        //print('project snapshot data is: ${snapshot.data}');

        return DropdownButton(
            style: TextStyle(
              fontFamily: 'Monserrat',
              fontStyle: FontStyle.normal,
              fontSize: 20,
            ),
            disabledHint: Text("You can't select anything."),
            items: snapshot.data.map((valorCity) {
              print(valorCity['name']);
              return DropdownMenuItem<String>(
                value: valorCity['pk'].toString(),
                child: Text(valorCity['name']),
              );
            }), //allCities(snapshot.data),
            onChanged: (String newValue) {
              setState(() {
                value = newValue;
              });
            });
      },
    );
  }
}
