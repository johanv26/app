import 'package:flutter/material.dart';

class UserAppBar extends StatelessWidget {
  String imgProfile;
  String name;
  String email;

  UserAppBar(this.imgProfile, this.name, this.email);

  @override
  Widget build(BuildContext context) {
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
              name,
              style: TextStyle(
                fontFamily: 'Monserrat',
                fontStyle: FontStyle.normal,
                color: Color(0xff1d976c),
                fontSize: 25,
              ),
            ),
          ],
        ),
      ),
      leading: Container(
        margin: EdgeInsets.only(left: 10.0, top: 10.0),
        child: CircleAvatar(
          backgroundImage: NetworkImage(
              'https://cdn.techinasia.com/wp-content/uploads/2016/02/pawel-netreba-bfab.jpg'),
        ),
      ),
    );
  }
}
