import 'dart:async';
import 'dart:io';
import 'package:clean_architechture/config/colors.dart';
import 'package:clean_architechture/data/checkin/models/response/checkin_response.dart';
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
  var checkInRes="";
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
            title: const Text('Make a choice'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      _openGallary(context);
                    },
                    child:const  Text("Gallary"),
                  ),
                  const Padding(padding: EdgeInsets.all(8.0)),
                  GestureDetector(
                    onTap: () {
                      _openCamera(context);
                    },
                     child: const Text("Camera"),
                  )
                ],
              ),
            ),
          );
        });
  }

  Widget buildGridView() {
    if (imageFiles.isEmpty) {
      return const Text("No image Selected!");
    } else {
      return GridView.count(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        crossAxisCount: imageFiles.length,
        children: List.generate(imageFiles.length, (index) {
          var asset = imageFiles[index];
          return Stack(
            children: [
              Expanded(
                  child: Image.file(
                asset,
                height: 300.0,
                fit: BoxFit.cover,
              )),
              Positioned(
                top: -1,
                left: -9,
                child: Container(
                    child: FlatButton(
                  onPressed: () {
                    setState(() {
                      imageFiles.removeAt(index);
                    });
                  },
                  child: const Icon(
                    Icons.delete_forever,
                    color: Colors.red,
                  ),
                )),
              )
            ],
          );
        }),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
            title: const Text(
              "Check in",
              style: TextStyle(fontSize: 18),
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.all(20.0),
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
                            const SizedBox(height: 30),
                            Container(
                              height: 200,
                              child: buildGridView(),
                            ),
                            const SizedBox(height: 30),
                            TextField(
                              keyboardType: TextInputType.multiline,
                              textInputAction: TextInputAction.newline,
                              controller: noteTextController,
                              style: const TextStyle(
                                height: 2.0,
                              ),
                              decoration: const InputDecoration(
                                hintText: 'Ghi ch?? .',
                              ),
                            ),
                            const SizedBox(height: 20),
                            Container(
                              child: Text(
                                state is CheckInSuccessState
                                    ? state.message
                                    : "",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.lightGreen),
                              ),
                            ),
                            Container(
                              child: Text(
                                state is CheckInErrorState
                                    ? state.message
                                    : "",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red),
                              ),
                            ),
                            const SizedBox(height: 40),
                            InkWell(
                              onTap: () {
                                context.read<CheckInBloc>().add(CheckInProcess(
                                    files: imageFiles,
                                    note: noteTextController.text,
                                    isError: true));
                              },
                              borderRadius: BorderRadius.circular(30),
                              child: Container(
                                width: size.width * 0.8,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: AppColors.kPrimaryColor,
                                ),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                alignment: Alignment.center,
                                child: const Text(
                                  'Check In',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
