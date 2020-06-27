import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './get_cities.dart';

class SignupScreen extends StatefulWidget {
  static const routeName = '/signup';

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String value = 'cero';
  @override
  Widget build(BuildContext context) {
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
                          Icons.alternate_email,
                          color: Color(0xff1d976c),
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
                      style: TextStyle(
                          fontFamily: 'Monserrat',
                          fontStyle: FontStyle.normal,
                          fontSize: 18,
                          color: Colors.black54),
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.accessibility,
                          color: Color(0xff1d976c),
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                        hintText: 'Nombre completo',
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
                      height: 30,
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
                          Icons.security,
                          color: Color(0xff1d976c),
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
                      onPressed: () {},
                    ),
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
