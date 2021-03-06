import 'package:app_login_ui/User/bloc/bloc_user.dart';
import 'package:app_login_ui/widgets/text_input.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:app_login_ui/widgets/button_green.dart';
import 'package:app_login_ui/User/screens/landing_screen.dart';
import 'package:app_login_ui/User/model/user.dart';
import 'package:app_login_ui/widgets/flush_bar.dart';

class SigninScreen extends StatefulWidget {
  static const routeName = '/signin';

  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
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
            return loginPrincipalScreen();
          } else {
            return LandingScreen();
          }
        });
  }

  Widget loginPrincipalScreen() {
    final _controllerEmailUser = TextEditingController();
    final _controllerPasswordUser = TextEditingController();
    bool _validateEmail = false;
    bool _validatePassword = false;
    bool _AfterFirstEntryToText;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        color: Colors.white,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Image.asset(
                'assets/images/logo.png',
                height: 100,
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                'Ingresa si tienes cuenta',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30,
                    color: Color(0xff1d976c),
                    fontFamily: 'Monserrat',
                    fontStyle: FontStyle.normal),
              ),
              SizedBox(
                height: 80,
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
                  'Ingresar',
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

                  _validateEmail = _controllerEmailUser.text.isEmpty;
                  _validatePassword = _controllerPasswordUser.text.isEmpty;
                  if (_validateEmail | _validatePassword) {
                    print("esta vacio los campos   ${_validateEmail}");
                    signupErrorFlushBar(context);
                  } else {
                    userBloc.signOut(); //Force closed
                    //thesession by flutter bug
                    userBloc
                        .signInEmailPassword(_controllerEmailUser.text,
                            _controllerPasswordUser.text)
                        .then((dynamic user) {
                      print("el usuario es ${user}");
                      if (user == null) {
                        loginErrorFlushBar(context);
                      } else {
                        print("el usuario es ${_controllerEmailUser.text}");
                        userBloc.updateUserData(User(
                            uid: user.uid,
                            name: user.displayName,
                            password: _controllerPasswordUser.text,
                            email: _controllerEmailUser.text));
                      }
                    });
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              ButtonGreen(
                text: 'Inicia sesión con Gmail',
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
  }
}
