import 'dart:math';
import 'package:flutter/cupertino.dart';

class Food{
  int id;
  String name;
  String urlName;
  Duration duration;
  Complexity complexity;
  // ignore: deprecated_member_use
  List<String> ingredients= List<String>();
  int categoryId;
  Food({
    @required this.name,
    @required this.urlName,
    @required this.duration,
    this.complexity,
    this.ingredients,
    this.categoryId
}){
    this.id=Random().nextInt(100);
  }
}
enum Complexity{
  Simple,
  Medium,
  Hard
}