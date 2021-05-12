import 'package:flutter/material.dart';
import 'package:food_app/models/food.dart';
import './models/category.dart';

// ignore: non_constant_identifier_names
final FAKE_CATEGORIES = [
  Category(id: 1, content: 'japanese\'s Foods', color:Colors.deepOrange),
  Category(id: 2, content: 'Pizza', color:Colors.teal),
  Category(id: 3, content: 'Hamburgers', color:Colors.pink),
  Category(id: 4, content: 'Italian', color:Colors.blueAccent),
  Category(id: 5, content: 'Milk & Yogurt', color:Colors.deepPurple),
  Category(id: 6, content: 'Vegetables', color:Colors.cyanAccent),
  Category(id: 8, content: 'japanese\'s Foods', color:Colors.deepOrange),
  Category(id: 8, content: 'Pizza', color:Colors.teal),
  Category(id: 10, content: 'Hamburgers', color:Colors.pink),
  Category(id: 11, content: 'Italian', color:Colors.blueAccent),
  Category(id: 12, content: 'Milk & Yogurt', color:Colors.deepPurple),
  Category(id: 13, content: 'Vegetables', color:Colors.cyanAccent),
  Category(id: 14, content: 'japanese\'s Foods', color:Colors.deepOrange),
  Category(id: 15, content: 'Pizza', color:Colors.teal),
  Category(id: 16, content: 'Hamburgers', color:Colors.pink),
  Category(id: 17, content: 'Italian', color:Colors.blueAccent),
  Category(id: 18, content: 'Milk & Yogurt', color:Colors.deepPurple),
  Category(id: 19, content: 'Vegetables', color:Colors.cyanAccent),
];
final FAKE_FOODS=[
 Food(
   name: 'Pizza',
   urlName: 'https://s1.img.yan.vn/YanNews/2167221/201607/20160707-042750-1_600x375.jpg',
   duration: Duration(minutes: 25),
   complexity: Complexity.Medium,
   ingredients: ['Pizza hải sản','Pizza gà rán'],
   categoryId: 2
 ),
  Food(
      name: 'Pizza',
      urlName: 'https://www.pizzaexpress.vn/wp-content/uploads/2020/12/pizza_fresca.jpg',
      duration: Duration(minutes: 25),
      complexity: Complexity.Medium,
      ingredients: ['Pizza hải sản','Pizza gà rán'],
      categoryId: 2
  ),
  Food(
      name: 'Pizza',
      urlName: 'https://onmilwaukee.com/images/articles/le/leonardospizza/leonardospizza_fullsize_story1.jpg',
      duration: Duration(minutes: 25),
      complexity: Complexity.Medium,
      ingredients: ['Pizza hải sản','Pizza gà rán'],
      categoryId: 2
  ),
  Food(
      name: 'Pizza',
      urlName: 'https://www.skinnytaste.com/wp-content/uploads/2020/05/Margherita-Pizza-1-3.jpg',
      duration: Duration(minutes: 25),
      complexity: Complexity.Medium,
      ingredients: ['Pizza hải sản','Pizza gà rán'],
      categoryId: 2
  ),
  Food(
      name: 'Pizza',
      urlName: 'https://s1.img.yan.vn/YanNews/2167221/201607/20160707-042750-1_600x375.jpg',
      duration: Duration(minutes: 25),
      complexity: Complexity.Medium,
      ingredients: ['Pizza hải sản','Pizza gà rán'],
      categoryId: 2
  ),
  Food(
      name: 'Pizza',
      urlName: 'https://s1.img.yan.vn/YanNews/2167221/201607/20160707-042750-1_600x375.jpg',
      duration: Duration(minutes: 25),
      complexity: Complexity.Medium,
      ingredients: ['Pizza hải sản','Pizza gà rán'],
      categoryId: 2
  ),
  Food(
      name: 'Pizza',
      urlName: 'https://s1.img.yan.vn/YanNews/2167221/201607/20160707-042750-1_600x375.jpg',
      duration: Duration(minutes: 25),
      complexity: Complexity.Medium,
      ingredients: ['Pizza hải sản','Pizza gà rán'],
      categoryId: 2
  ),
  Food(
      name: 'Pizza',
      urlName: 'https://s1.img.yan.vn/YanNews/2167221/201607/20160707-042750-1_600x375.jpg',
      duration: Duration(minutes: 25),
      complexity: Complexity.Medium,
      ingredients: ['Pizza hải sản','Pizza gà rán'],
      categoryId: 2
  ),
  Food(
      name: 'Pizza',
      urlName: 'https://s1.img.yan.vn/YanNews/2167221/201607/20160707-042750-1_600x375.jpg',
      duration: Duration(minutes: 25),
      complexity: Complexity.Medium,
      ingredients: ['Pizza hải sản','Pizza gà rán'],
      categoryId: 2
  ),
];