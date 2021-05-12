import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/models/category.dart';
import 'package:food_app/models/food.dart';

import '../../fake_data.dart';

// ignore: must_be_immutable
class FoodsPage extends StatelessWidget {
  static const String routeName = '/FoodsPage';
  Category category;

  FoodsPage({this.category});

  @override
  Widget build(BuildContext context) {
    Map<String, Category> arguments = ModalRoute.of(context).settings.arguments;
    this.category = arguments['category'];
    List<Food> foods =
        FAKE_FOODS.where((e) => e.categoryId == this.category.id).toList();
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Food \'s from ${this.category.content}'),
        centerTitle: true,
      ),
      body: Center(
        child: ListView.builder(
            itemCount: foods.length,
            itemBuilder: (context, index) {
              Food food = foods[index];
              return Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(20),
                    child: ClipRRect(
                      child: Center(
                        child: FadeInImage.assetNetwork(
                            placeholder: 'assets/images/loading.gif',
                            image: food.urlName),
                      ),
                    ),
                  ),
                  Positioned(
                      top: 30,
                      left: 30,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.black45,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 2,color: Colors.white)
                        ),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.timer, color: Colors.white, size: 25),
                            Text(
                              '${food.duration.inMinutes} minutes',
                              style: TextStyle(fontSize: 22, color: Colors.white),
                            )
                          ],
                        ),
                      )
                  )
                ],
              );
            }),
      ),
    );
  }
}
