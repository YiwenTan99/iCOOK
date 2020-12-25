import 'package:flutter/material.dart';

String labelText;
String placeholder;

class BuildTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final FormFieldValidator validator;
  final TextEditingController controller;
  const BuildTextField(
      {Key key,
      this.hintText,
      this.icon,
      this.onChanged,
      this.validator,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: TextFormField(
        controller: controller,
        validator: validator,
        //obscureText: true,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,

          /*icon: Icon(
            Icons.person,
            color: kPrimaryColor,
          ),*/
          /* suffixIcon: Icon(
            Icons.visibility,
            color: kPrimaryColor,
          ),*/
          //border: InputBorder.none,
          contentPadding: EdgeInsets.only(bottom: 3),
          labelText: labelText,
          labelStyle: TextStyle(
            fontSize: 24,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          //hintText: placeholder,
          hintStyle: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
