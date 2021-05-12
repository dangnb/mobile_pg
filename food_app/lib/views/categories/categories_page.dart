import 'package:flutter/cupertino.dart';
import 'package:food_app/fake_data.dart';
import 'package:food_app/views/categories/category_item.dart';

class CategoriesPage extends StatelessWidget {
  static const routeName='/CategoriesPage';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView(
      padding: EdgeInsets.all(12),
        children: FAKE_CATEGORIES
            .map((category) => CategoryItem(category: category))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            childAspectRatio: 3 /2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12
        ));
  }
}
