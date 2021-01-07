import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'package:iCOOK/Screens/Apple/Apple.dart' as Apple;
import 'package:iCOOK/Screens/BellPepper/BellPepper.dart' as BellPepper;
import 'package:iCOOK/Screens/Broccoli/Broccoli.dart' as Broccoli;
import 'package:iCOOK/Screens/Carrot/Carrot.dart' as Carrot;
import 'package:iCOOK/Screens/Grape/Grape.dart' as Grape;
import 'package:iCOOK/Screens/Mushroom/Mushroom.dart' as Mushroom;
import 'package:iCOOK/Screens/Orange.dart' as Orange;
import 'package:iCOOK/Screens/WhiteP.dart' as WhiteP;
import 'package:iCOOK/Screens/Pumpkin.dart' as Pumpkin;
import 'package:iCOOK/Screens/Strawberry.dart' as Strawberry;
import 'package:iCOOK/Screens/RedSnapper.dart' as RedSnapper;
import 'package:iCOOK/Screens/Stingray.dart' as Stingray;
import 'package:iCOOK/Screens/Tomato.dart' as Tomato;
import 'package:iCOOK/Screens/TorpedoS.dart' as TorpedoS;
import 'package:iCOOK/Screens/YellowT.dart' as YellowT;

class ScanScreen extends StatefulWidget {
  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  List _outputs;
  File _image;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _loading = true;

    loadModel().then((value) {
      setState(() {
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.grey[300],
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
        body: _loading
            ? Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              )
            : Container(
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _image == null
                          ? Container(
                              child: Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Column(children: <Widget>[
                                  // Text(
                                  //   "Tap on the right bottom image icon to access the scan feature",
                                  //     style: TextStyle(
                                  //       fontSize: 30.0,
                                  //       fontWeight: FontWeight.w400,
                                  //       color: Colors.grey[800]
                                  //     ),
                                  //   ),
                                  Image(
                                      image:
                                          AssetImage("assets/images/scan.png")),
                                  // Align(
                                  //   alignment: Alignment.bottomLeft,
                                  //   child: Image(
                                  //     image: AssetImage("assets/images/arrow.png"),
                                  //       width: 230,
                                  //       height: 200,
                                  //     ),
                                  //   ),
                                ]),
                              ),
                            )
                          : Image.file(_image),
                      SizedBox(
                        height: 30,
                      ),
                      _outputs != null
                          ? Column(
                              children: [
                                Text(
                                  "${_outputs[0]["label"]} Detected",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    background: Paint()
                                      ..color = Colors.grey[300],
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                RaisedButton(
                                  color: Colors.lightGreen[50],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                  // onPressed: () {
                                  child: Text(
                                    "Suggested Recipe",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: Colors.grey[800],
                                    ),
                                  ),
                                  onPressed: () {
                                    if (_outputs[0]["label"] == "Apple") {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) {
                                          return Apple.Apple();
                                        }),
                                      );
                                    } else if (_outputs[0]["label"] ==
                                        "Bell Pepper") {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                BellPepper.BellPepper()),
                                      );
                                    } else if (_outputs[0]["label"] ==
                                        "Broccoli") {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Broccoli.Broccoli()),
                                      );
                                    } else if (_outputs[0]["label"] ==
                                        "Carrot") {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Carrot.Carrot()),
                                      );
                                    } else if (_outputs[0]["label"] ==
                                        "Grape") {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Grape.Grape()),
                                      );
                                    } else if (_outputs[0]["label"] ==
                                        "Mushroom") {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Mushroom.Mushroom()),
                                      );
                                    } else if (_outputs[0]["label"] ==
                                        "Orange") {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Orange.Orange()),
                                      );
                                    } else if (_outputs[0]["label"] ==
                                        "White Pomfret") {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                WhiteP.WhiteP()),
                                      );
                                    } else if (_outputs[0]["label"] ==
                                        "Pumpkin") {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Pumpkin.Pumpkin()),
                                      );
                                    } else if (_outputs[0]["label"] ==
                                        "Red Snapper") {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                RedSnapper.RedSnapper()),
                                      );
                                    } else if (_outputs[0]["label"] ==
                                        "Stingray") {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Stingray.Stingray()),
                                      );
                                    } else if (_outputs[0]["label"] ==
                                        "Strawberry") {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Strawberry.Strawberry()),
                                      );
                                    } else if (_outputs[0]["label"] ==
                                        "Tomato") {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Tomato.Tomato()),
                                      );
                                    } else if (_outputs[0]["label"] ==
                                        "Torpedo Scad") {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                TorpedoS.TorpedoS()),
                                      );
                                    } else if (_outputs[0]["label"] ==
                                        "Yellowtail Scad") {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                YellowT.YellowT()),
                                      );
                                    }
                                  },
                                ),
                              ],
                            )
                          : Container(
                              // child: Column(
                              //   children:[
                              //    Text(
                              //      "Object Couldn't detect"
                              //    ),
                              //   ],
                              // ),
                              ),
                    ],
                  ),
                ),
              ),
        floatingActionButton: Container(
          height: 80.0,
          width: 80.0,
          child: FittedBox(
            child: FloatingActionButton(
              onPressed: () {
                _showChoiceDialog(context);
              },
              child: Icon(Icons.image),
              backgroundColor: Colors.lime,
            ),
          ),
        ),

        // floatingActionButton: FloatingActionButton(
        //   onPressed: pickImage,
        //   child: Icon(Icons.image),
        // ),
      ),
    );
  }

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.lime[50],
            title: Text(
              "Load Image From",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Stack(
                      children: <Widget>[
                        Align(
                            alignment: Alignment(-0.9, 0.0),
                            child: Icon(Icons.photo_library)),
                        Align(
                            alignment: Alignment(-0.4, 0.0),
                            child: Text(
                              "Gallery",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ))
                      ],
                    ),
                    onTap: () {
                      _openGallary(context);
                    },
                  ),
                  Padding(padding: EdgeInsets.all(8.0)),
                  GestureDetector(
                    child: Stack(
                      children: <Widget>[
                        Align(
                            alignment: Alignment(-0.9, 0.0),
                            child: Icon(Icons.photo_camera)),
                        Align(
                            alignment: Alignment(-0.4, 0.0),
                            child: Text(
                              " Camera",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ))
                      ],
                    ),
                    onTap: () {
                      _openCamera(context);
                    },
                  ),
                  // Align(
                  //   alignment: Alignment(0.9,0.0),
                  //   child: RaisedButton(
                  //     shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(18.0)),
                  //     onPressed: () {
                  //       Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) {
                  //           return BottomNavi1();
                  //         },
                  //       ),
                  //     );
                  //     },
                  //     child: const Text(
                  //       'Cancel',
                  //       style: TextStyle(
                  //         fontSize: 14,
                  //         color: Colors.blueGrey
                  //       ),
                  //     ),
                  //     color: Colors.lime[100],
                  //     textColor: Colors.white,
                  //     elevation: 5,
                  //   ),
                  // ),
                ],
              ),
            ),
          );
        });
  }

  _openGallary(context) async {
    // ignore: deprecated_member_use
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState(() {
      _loading = true;
      _image = picture;
    });
    Navigator.of(context).pop();
    classifyImage(_image);
  }

  _openCamera(BuildContext context) async {
    WidgetsFlutterBinding.ensureInitialized();
    // ignore: deprecated_member_use
    var picture = await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState(() {
      _loading = true;
      _image = picture;
    });
    Navigator.of(context).pop();
    classifyImage(_image);
  }

  pickImage() async {
    // ignore: deprecated_member_use
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image == null) return null;
    setState(() {
      _loading = true;
      _image = image;
    });
    classifyImage(image);
  }

  classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 15,
      threshold: 0.9,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _loading = false;
      _outputs = output;
    });
  }

  loadModel() async {
    await Tflite.loadModel(
      model: "assets/Test/model.tflite",
      labels: "assets/Test/labels.txt",
    );
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }
}
