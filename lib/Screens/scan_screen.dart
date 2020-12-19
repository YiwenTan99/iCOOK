import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:iCOOK/components/bottomnavi.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

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
      body: _loading
          ? Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      )
          : Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _image == null ? Container() : Image.file(_image),
            SizedBox(
              height: 20,
            ),
            _outputs != null
                ? Text(
              "${_outputs[0]["label"]}",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                background: Paint()..color = Colors.white,
              ),
            )
                : Container()
          ],
        ),
      ),
      floatingActionButton:Container(
        height: 80.0,
        width: 80.0,
        child: FittedBox(
          child: FloatingActionButton(onPressed: (){
        _showChoiceDialog(context);
      },
        child: Icon(Icons.image),
        backgroundColor: Colors.lime,),
        ),
      ),

      // floatingActionButton: FloatingActionButton(
      //   onPressed: pickImage,
      //   child: Icon(Icons.image),
      // ),
    );
  }

   Future<void> _showChoiceDialog(BuildContext context){
    return showDialog(context: context,builder: (BuildContext context){
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
                    alignment: Alignment(-0.9,0.0),
                    child: Icon(Icons.photo_library)
                  ),
                  Align(
                    alignment: Alignment(-0.4,0.0),
                    child: Text(
                      "Gallery",
                      style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    )
                  )
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
                    alignment: Alignment(-0.9,0.0),
                    child: Icon(Icons.photo_camera)
                  ),
                  Align(
                    alignment: Alignment(-0.4,0.0),
                    child: Text(
                      " Camera",
                      style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    )
                  )
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

  _openCamera(BuildContext context) async{
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