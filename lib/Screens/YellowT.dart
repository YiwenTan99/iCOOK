import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iCOOK/components/bottomnavi.dart';
import 'package:iCOOK/Screens/FinalRecipe.dart';

class YellowT extends StatefulWidget {
  @override
  _YellowTState createState() => _YellowTState();
}

class _YellowTState extends State<YellowT> {
  int i = 0;
  bool fish = true;
  bool apple = true;
  bool orange = true;
  bool grape = true;
  bool carrot = true;
  bool broccoli = true;
  bool mushroom = true;
  bool strawberry = true;
  bool tomato = true;
  bool bellpepper = true;
  bool yellowtail = true;
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
          'YellowT',
          style: GoogleFonts.specialElite(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.black,
          ),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),

      floatingActionButton: new FloatingActionButton(
        child: const Icon(Icons.send),
        backgroundColor: Colors.red[900],
        onPressed: () {
          //Navigator.pushNamed(context, '/result');
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Final(
                  fish,
                  apple,
                  orange,
                  grape,
                  carrot,
                  broccoli,
                  mushroom,
                  strawberry,
                  tomato,
                  bellpepper,
                  yellowtail),
            ),
          );
        },
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Divider(
                color: Colors.red[300],
                thickness: 5,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    'Choose food you\'d like to cook',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Container(
                child: FlatButton(
                  //onPressed: () => pressAttention = !pressAttention,
                  color: fish ? Colors.white : Colors.redAccent[100],
                  onPressed: () {
                    setState(() {
                      i++;
                      fish = !fish;
                    });
                  },
                  padding: EdgeInsets.all(50.0),
                  child: Image.asset('assets/images/tomatoegg.jpg'),
                ),
              ),
              Container(
                child: FlatButton(
                  //onPressed: () => pressAttention = !pressAttention,
                  color: apple ? Colors.white : Colors.redAccent[100],
                  onPressed: () {
                    setState(() {
                      i++;
                      apple = !apple;
                    });
                  },
                  padding: EdgeInsets.all(50.0),
                  child: Image.asset('assets/images/tomatoegg.jpg'),
                ),
              ),
              Container(
                child: FlatButton(
                  //onPressed: () => pressAttention = !pressAttention,
                  color: orange ? Colors.white : Colors.redAccent[100],
                  onPressed: () {
                    setState(() {
                      i++;
                      orange = !orange;
                    });
                  },
                  padding: EdgeInsets.all(50.0),
                  child: Image.asset('assets/images/tomatoegg.jpg'),
                ),
              ),
              Container(
                child: FlatButton(
                  //onPressed: () => pressAttention = !pressAttention,
                  color: grape ? Colors.white : Colors.redAccent[100],
                  onPressed: () {
                    setState(() {
                      i++;
                      grape = !grape;
                    });
                  },
                  padding: EdgeInsets.all(50.0),
                  child: Image.asset('assets/images/tomatoegg.jpg'),
                ),
              ),
              Container(
                child: FlatButton(
                  //onPressed: () => pressAttention = !pressAttention,
                  color: carrot ? Colors.white : Colors.redAccent[100],
                  onPressed: () {
                    setState(() {
                      i++;
                      carrot = !carrot;
                    });
                  },
                  padding: EdgeInsets.all(50.0),
                  child: Image.asset('assets/images/tomatoegg.jpg'),
                ),
              ),
              Container(
                child: FlatButton(
                  //onPressed: () => pressAttention = !pressAttention,
                  color: broccoli ? Colors.white : Colors.redAccent[100],
                  onPressed: () {
                    setState(() {
                      i++;
                      broccoli = !broccoli;
                    });
                  },
                  padding: EdgeInsets.all(50.0),
                  child: Image.asset('assets/images/tomatoegg.jpg'),
                ),
              ),
              Container(
                child: FlatButton(
                  //onPressed: () => pressAttention = !pressAttention,
                  color: mushroom ? Colors.white : Colors.redAccent[100],
                  onPressed: () {
                    setState(() {
                      i++;
                      mushroom = !mushroom;
                    });
                  },
                  padding: EdgeInsets.all(50.0),
                  child: Image.asset('assets/images/tomatoegg.jpg'),
                ),
              ),
              Container(
                child: FlatButton(
                  //onPressed: () => pressAttention = !pressAttention,
                  color: strawberry ? Colors.white : Colors.redAccent[100],
                  onPressed: () {
                    setState(() {
                      i++;
                      strawberry = !strawberry;
                    });
                  },
                  padding: EdgeInsets.all(50.0),
                  child: Image.asset('assets/images/tomatoegg.jpg'),
                ),
              ),
              Container(
                child: FlatButton(
                  //onPressed: () => pressAttention = !pressAttention,
                  color: tomato ? Colors.white : Colors.redAccent[100],
                  onPressed: () {
                    setState(() {
                      i++;
                      tomato = !tomato;
                    });
                  },
                  padding: EdgeInsets.all(50.0),
                  child: Image.asset('assets/images/tomatoegg.jpg'),
                ),
              ),
              Container(
                child: FlatButton(
                  //onPressed: () => pressAttention = !pressAttention,
                  color: bellpepper ? Colors.white : Colors.redAccent[100],
                  onPressed: () {
                    setState(() {
                      i++;
                      bellpepper = !bellpepper;
                    });
                  },
                  padding: EdgeInsets.all(50.0),
                  child: Image.asset('assets/images/tomatoegg.jpg'),
                ),
              ),
              Container(
                child: FlatButton(
                  //onPressed: () => pressAttention = !pressAttention,
                  color: yellowtail ? Colors.white : Colors.redAccent[100],
                  onPressed: () {
                    setState(() {
                      i++;
                      yellowtail = !yellowtail;
                    });
                  },
                  padding: EdgeInsets.all(50.0),
                  child: Image.asset('assets/images/tomatoegg.jpg'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}