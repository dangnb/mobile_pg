import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/models/category.dart';
import 'package:food_app/views/food/foods_page.dart';

// ignore: must_be_immutable
class CategoryItem extends StatelessWidget {
  Category category;

  CategoryItem({this.category});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Color _color = this.category.color;
    return InkWell(
      onTap: (){
        print('tapped to category ${this.category.content}');
        // Navigator.of(context).push(
        //   MaterialPageRoute(builder: (context)=>FoodsPage(category: this.category,))
        // );
        Navigator.pushNamed(context, FoodsPage.routeName,arguments: {'category':category});
      },
      splashColor: Colors.deepPurple,
      child: Container(
        child: Center(
            child: Text(
              this.category.content,
              style: Theme.of(context).textTheme.headline1,
            )),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [_color.withOpacity(0.6), _color],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
            color: _color,
            borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
