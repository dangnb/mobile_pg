
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CheckIn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CheckInState();
  }
}

class _CheckInState extends State<CheckIn> {
  // ignore: deprecated_member_use
  List<File> imageFiles= [];
  _openGallary(BuildContext context) async{
    var picture= await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState(() {
      imageFiles.add(picture);
    });
    Navigator.of(context).pop();
  }
  _openCamera(BuildContext context) async {
    var picture= await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState(() {
      imageFiles.add(picture);
    });
    Navigator.of(context).pop();
  }

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Make a choice'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text("Gallary"),
                    onTap: () {
                      _openGallary(context);
                    },
                  ),
                  Padding(padding: EdgeInsets.all(8.0)),
                  GestureDetector(
                    child: Text("Camera"),
                    onTap: () {
                      _openCamera(context);
                    },
                  )
                ],
              ),
            ),
          );
        });
  }
  Widget _decideImageView(){
    if(imageFiles.isEmpty||imageFiles.length==0){
      return Text("No image Selected!");
    }else{
      return ListView.builder(
        itemCount: imageFiles.length,
        itemBuilder: (BuildContext context, int index){
          return Container(
            child: Image.file(imageFiles[index], width: 400,height: 400,),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Check in"),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _decideImageView(),
              RaisedButton(
                onPressed: () {_showChoiceDialog(context);},
                child: Text("Select Image!"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
