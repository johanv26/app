import 'package:flutter/material.dart';

import 'package:app_login_ui/User/model/user.dart';

class UserInfoAppbar extends StatelessWidget {
  User user;

  UserInfoAppbar(@required this.user);

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
              //user.email[0:5],
              'probando',
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
              'https://lh3.googleusercontent.com/a-/AOh14Gh8AnBeNBI8qrlZIBjOC8l1KVYaJ4GapMfdmr50kQ=s96-c'),
        ),
      ),
    );
  }
}
