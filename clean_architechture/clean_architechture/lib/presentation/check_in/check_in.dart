
import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pg_app/repositoties/check_in_repository.dart';

class CheckIn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CheckInState();
  }
}

class _CheckInState extends State<CheckIn> {
  final picker = ImagePicker();
  // ignore: deprecated_member_use
  List<File> imageFiles= [];
  _openGallary(BuildContext context) async{
    final pickedFile= await picker.getImage(source: ImageSource.gallery);
    setState(() {
      imageFiles.add(File(pickedFile!.path));
    });
    Navigator.of(context).pop();
  }
  // ignore: always_declare_return_types
  _openCamera(BuildContext context) async {
    final pickedFile= await picker.getImage(source: ImageSource.camera);
    setState(() {
      imageFiles.add(File(pickedFile!.path));
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
  Widget buildGridView() {
    if(imageFiles.isEmpty||imageFiles.length==0){return Text("No image Selected!");}else{
      return GridView.count(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        crossAxisCount: imageFiles.length,
        children: List.generate(imageFiles.length, (index) {
          File asset = imageFiles[index];
          return Image.file(
            asset,
            width: 2,
            height: 2,
          );
        }),
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
              buildGridView(),
              RaisedButton(
                onPressed: () {_showChoiceDialog(context);},
                child: Text("Select Image!"),
              ),
              RaisedButton(
                onPressed: () {
                  CheckInRepository repository= new CheckInRepository();
                  repository.CheckIn(files: imageFiles, note: "dangnb");
                },
                child: Text("Check in!"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
