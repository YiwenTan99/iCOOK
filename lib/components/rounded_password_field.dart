import 'package:flutter/material.dart';
import 'package:iCOOK/components/text_field_container.dart';
import 'package:iCOOK/shared/constant.dart';

class RoundedPasswordField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final FormFieldValidator validator;
  const RoundedPasswordField({
    Key key,
    this.hintText,
    this.icon,
    this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        validator: validator,
        obscureText: true,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          // suffixIcon: Icon(
          //   Icons.visibility,
          //   color: kPrimaryColor,
          // ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
