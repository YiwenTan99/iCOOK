import 'package:flutter/material.dart';
import 'package:iCOOK/components/text_field_container.dart';
import 'package:iCOOK/shared/constant.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final FormFieldValidator validator;
  const RoundedInputField({
    Key key,
    this.validator,
    this.hintText,
    this.icon,
    this.onChanged,
    Icon prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        validator: validator,
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
