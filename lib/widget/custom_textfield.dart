import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {Key? key,
      this.controller,
      this.hintText,
      this.lebelText,
      this.prefixICon,
      this.suffixIcon,
      this.validator,
      this.validator2})
      : super(key: key);

  TextEditingController? controller;
  String? lebelText, hintText;
  dynamic? suffixIcon, prefixICon;
  dynamic? validator;
  VoidCallback? validator2;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
          labelText: lebelText,
          fillColor: Colors.white,
          filled: true,
          suffix: suffixIcon,
          prefix: prefixICon,
          labelStyle: TextStyle(color: Colors.teal),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.red, width: 1)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.blue, width: 1)),
          hintStyle: TextStyle(color: Colors.red),
          hintText: hintText),
    );
  }
}
