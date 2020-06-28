import 'package:app_login_ui/User/model/user.dart';
import 'package:app_login_ui/User/user_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:app_login_ui/User/bloc_user.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class UserAppBar extends StatelessWidget {
  UserBloc userBloc;
  User user;
  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);

    return StreamBuilder(
      stream: userBloc.streamFirebase,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return CircularProgressIndicator();
          case ConnectionState.none:
            return CircularProgressIndicator();
          case ConnectionState.active:
            return showProfileData(snapshot);
          case ConnectionState.done:
            return showProfileData(snapshot);
        }
      },
    );
  }

  Widget showProfileData(AsyncSnapshot snapshot) {
    if (!snapshot.hasData || snapshot.hasError) {
      print("No logeado");
      return Container(
          margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
          child: Text("No se pudo cargar la información. Haz login"));
    } else {
      print("Logeado");
      print(snapshot.data);
      user = User(
          name: snapshot.data.displayName,
          email: snapshot.data.email,
          photoURL: snapshot.data.photoUrl);
      return UserInfoAppbar(user);
    }
  }
}

//UserInfo("photo", "Johan", "mail")}
