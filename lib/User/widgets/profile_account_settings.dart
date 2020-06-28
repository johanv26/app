import 'package:flutter/material.dart';
import 'package:app_login_ui/widgets/button_bar.dart';

class AccountSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(children: <Widget>[
      Container(
        color: Colors.greenAccent,
        child: Container(
          margin: EdgeInsets.only(top: 200.0, left: 100.0),
          child: Text(
            'Configuracion de la cuenta ',
            style: TextStyle(
              fontSize: 24.0,
              fontFamily: "Lato",
              color: Colors.black,
            ),
          ),
        ),
      ),
      ButtonsBar(),
    ]);
  }
}

class AccountSettings2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.yellowAccent,
      child: Container(
        margin: EdgeInsets.only(top: 200.0, left: 100.0),
        child: Text(
          'Configuracion de otros xD',
          style: TextStyle(
            fontSize: 24.0,
            fontFamily: "Lato",
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
