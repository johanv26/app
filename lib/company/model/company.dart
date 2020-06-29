import 'package:flutter/material.dart';

class Company {
  String id;
  String name;
  String description;

  Company({
    Key key,
    @required this.name,
    @required this.description,
  });
}
