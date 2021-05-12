import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('This is Home Page'),
      ),
      body: Center(
        child: Text('Home'),
      ),
    ));
  }
}
