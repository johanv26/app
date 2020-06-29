import 'package:flutter/material.dart';
import 'package:app_login_ui/company/model/company.dart';

class Job {
  String id;
  String name;
  String description;
  String company;
  String tipoTrabajo;
  String place;
  int salary;
  Company companyOwner;

  Job({
    Key key,
    @required this.name,
    @required this.description,
    @required this.companyOwner,
  });
}
