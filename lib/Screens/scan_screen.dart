import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScanScreen extends StatefulWidget {
  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text(
          'iCOOK - Scan',
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
        child: new Text("Scan page")
      )
    );
  }
}