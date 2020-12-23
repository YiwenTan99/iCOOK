import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iCOOK/components/bottomnavi.dart';

class RecipeDetail extends StatefulWidget {
  @override
  _RecipeDetailState createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[800],
        appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios, color: Colors.grey[600]),
          onPressed: () {
            Navigator.push(
              context,
                MaterialPageRoute(
                  builder: (context){
                   return BottomNavi1();
                  },
                ),
              );
            },
         ),
        title: Text(
          'Recipe',
          style: GoogleFonts.specialElite(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.black,
          ),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Container(
        child: RichText(
          text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(text: 'bold', style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: ' world!'),
            ],
          ),
        ),
      ),
    );
  }
}