import 'package:app_login_ui/screens/landing_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                  fontStyle: FontStyle.normal
              ),
            ),
            SizedBox(
              height: 80,
            ),
            TextField(
              style: TextStyle(
                  fontFamily: 'Monserrat',
                  fontStyle: FontStyle.normal,
                  fontSize: 18,
                  color: Colors.black54),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                hintText: 'Email',
                suffixIcon: Icon(
                  Icons.alternate_email, color: Color(0xff1d976c),
                ),
                contentPadding: const EdgeInsets.all(15),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(50.0),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              obscureText: false,
              style: TextStyle(
                  fontFamily: 'Monserrat',
                  fontStyle: FontStyle.normal,
                  fontSize: 18,
                  color: Colors.black54),
              decoration: InputDecoration(
                suffixIcon: Icon(
                  Icons.security, color: Color(0xff1d976c),
                ),
                filled: true,
                fillColor: Colors.grey[200],
                hintText: 'Contraseña',
                contentPadding: const EdgeInsets.all(15),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(50.0),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
            ),
            SizedBox(
              height: 100,
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
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LandingScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
