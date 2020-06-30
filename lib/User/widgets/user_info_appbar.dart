import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:app_login_ui/User/model/user.dart';

class UserInfoAppbar extends StatelessWidget {
  User user;

  UserInfoAppbar(@required this.user);
  final firestoreInstance = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    dynamic nombre = user.name;
    if (nombre == null) {
      nombre = "cargando";
    }
    dynamic foto = user.photoURL;
    if (foto == null) {
      foto =
          'https://cdn.techinasia.com/wp-content/uploads/2016/02/pawel-netreba-bfab.jpg';
    }
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      title: Container(
        padding: EdgeInsets.fromLTRB(10.0, 10.0, 0, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hola  ',
              style: TextStyle(
                fontFamily: 'Monserrat',
                fontStyle: FontStyle.normal,
                color: Colors.black,
                fontSize: 25,
              ),
            ),
            Text(
              user.email,
              //'probando',
              style: TextStyle(
                fontFamily: 'Monserrat',
                fontStyle: FontStyle.normal,
                color: Color(0xff1d976c),
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
      leading: Container(
        margin: EdgeInsets.only(left: 10.0, top: 10.0),
        child: CircleAvatar(
          backgroundImage: NetworkImage(foto),
        ),
      ),
    );
  }
}
