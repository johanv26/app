import 'package:app_login_ui/User/model/user.dart';
import 'package:app_login_ui/User/widgets/user_info_appbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:app_login_ui/User/bloc/bloc_user.dart';
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
      final firestoreInstance = Firestore.instance;
      dynamic value;
      dynamic uso;
      firestoreInstance
          .collection("users")
          .document(snapshot.data.uid)
          .get()
          .then((value) {
        print(value.data["name"]);

        print(uso);
        user = User(
            uid: snapshot.data.uid,
            name: snapshot.data.displayName,
            email: snapshot.data.email,
            photoURL: snapshot.data.photoUrl);
        return UserInfoAppbar(user);
      });
      user = User(
          uid: snapshot.data.uid,
          name: snapshot.data.displayName,
          email: snapshot.data.email,
          photoURL: snapshot.data.photoUrl);
      return UserInfoAppbar(user);
    }
  }
}

//UserInfo("photo", "Johan", "mail")}
