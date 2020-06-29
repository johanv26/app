import 'package:flutter/material.dart';

class User {
  final String uid;
  final String name;
  final String password;
  final String email;
  final String photoURL;
  final String city;
  //myFavoritePlaces
  //myPlaces

  User(
      {Key key,
      this.uid,
      @required this.name,
      this.password,
      @required this.email,
      this.photoURL,
      this.city});
}
