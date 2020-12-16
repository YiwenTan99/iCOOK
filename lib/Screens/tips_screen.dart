import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TipsScreen extends StatefulWidget {
  @override
  _TipsScreenState createState() => _TipsScreenState();
}

class _TipsScreenState extends State<TipsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text(
          'iCOOK - Tips & Tricks',
          style: GoogleFonts.specialElite(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.black,
          ),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: new Center(
        child: new Text("Tips page")
      )
    );
  }
}