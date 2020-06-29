import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String hintText;
  final TextInputType inputType;
  final TextEditingController controller;
  IconData iconData = Icons.security;
  bool obscureHidden = false;
  bool validate = false;
  TextInput({
    Key key,
    @required this.hintText,
    @required this.inputType,
    @required this.controller,
    this.obscureHidden,
    this.iconData,
    this.validate,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: inputType,
      obscureText: obscureHidden,
      style: TextStyle(
          fontFamily: 'Monserrat',
          fontStyle: FontStyle.normal,
          fontSize: 18,
          color: Colors.black54),
      decoration: InputDecoration(
        errorText: validate ? 'Valor no puede estar vacio' : null,
        suffixIcon: Icon(
          iconData,
          color: Color(0xff1d976c),
        ),
        filled: true,
        fillColor: Colors.grey[200],
        hintText: hintText,
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
    );
  }
}
