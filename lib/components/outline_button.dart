import 'package:flutter/material.dart';
import 'package:iCOOK/shared/constant.dart';

class OutButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;
  const OutButton({
    Key key,
    @required this.size,
    this.text,
    this.press,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        child: OutlineButton(
          padding: EdgeInsets.symmetric(vertical: 20),
          color: color,
          onPressed: press,
           borderSide: BorderSide(
              color: color,
            ),
          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(29.0)),
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}
