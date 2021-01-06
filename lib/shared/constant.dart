import 'package:flutter/material.dart';

//...
const kPrimaryColor = Color(0xFFAED581);
const kPrimaryLightColor = Color(0xFFF1F8E9);
const kPrimaryTextFieldColor = Color(0xFFFFF3E0);
const textInputDecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white, width: 2.0)),
  focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.pink, width: 2.0)),
);
