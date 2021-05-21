import 'dart:async';
import 'dart:io';
import 'package:clean_architechture/presentation/check_in/bloc/checkin_bloc.dart';
import 'package:clean_architechture/presentation/common/dialog/loading_dialog.dart';
import 'package:clean_architechture/presentation/login/bloc/login_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class CheckInScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CheckInScreenState();
  }
}

class _CheckInScreenState extends State<CheckInScreen> {
  final noteTextController = TextEditingController();
  final picker = ImagePicker();

  // ignore: deprecated_member_use
  List<File> imageFiles = [];
  _openGallary(BuildContext context) async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      imageFiles.add(File(pickedFile!.path));
    });
    Navigator.of(context).pop();
  }

  // ignore: always_declare_return_types
  _openCamera(BuildContext context) async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
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
    if (imageFiles.isEmpty || imageFiles.length == 0) {
      return Text("No image Selected!");
    } else {
      return GridView.count(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        crossAxisCount: imageFiles.length,
        children: List.generate(imageFiles.length, (index) {
          var asset = imageFiles[index];
          return Image.file(
            asset,
            width: 50.0,
            height: 50.0,
          );
        }),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocConsumer<CheckInBloc, CheckInSate>(
      listener: (context, state) {
        switch (state.runtimeType) {
          case CheckInSuccessState:
            LoadingDialog.hideLoadingDialog;
            break;
          case CheckInErrorState:
            print("Login error");
            LoadingDialog.hideLoadingDialog;
            break;
          case CheckInLoadingState:
            LoadingDialog.showLoadingDialog(context);
            break;
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Check in"),
          ),
          body: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(20.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          FlatButton(
                              onPressed: () => _showChoiceDialog(context),
                              child: const Icon(
                                Icons.camera_alt,
                                color: Colors.black12,
                                size: 100,
                              )),
                          const SizedBox(height: 10),
                          buildGridView(),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: noteTextController,
                            decoration: const InputDecoration(
                                hintText: 'Ghi chú'),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            child: Text(state is CheckInSuccessState?state.checkInResponse!.CheckIn_ShopAddress!:"", style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.lightGreen),),
                          ),
                        ],
                      ),
                    ),
                  ),

                  RaisedButton(
                    onPressed: () {
                      context.read<CheckInBloc>().add(CheckInProcess(
                          files: imageFiles, note: "dangnb", isError: true));
                    },
                    child: Text("Check in!"),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
