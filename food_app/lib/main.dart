import 'package:flutter/material.dart';
import 'package:food_app/views/categories/categories_page.dart';
import 'package:food_app/views/food/foods_page.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Food app Navigation',
      initialRoute: '/',
      routes: {
        FoodsPage.routeName:(context)=>FoodsPage(),
        CategoriesPage.routeName:(context)=>CategoriesPage()
      },
      theme: ThemeData(
        primaryColor: Colors.cyan,
        fontFamily: 'Noto_Sans',
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: TextStyle(
              color: Color.fromARGB(20, 52, 52, 1)
          ),
          bodyText2: TextStyle(
            color: Color.fromARGB(20, 52, 52, 1)
          ),
          headline1: TextStyle(
            fontSize: 28,
            color: Colors.white,
            fontFamily: 'Sunshiney'
          )
        )
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Food \'s categories'),
        ),
        body: SafeArea(
          child: CategoriesPage(),
        ) ,
      ),
    );
  }
}
