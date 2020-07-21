import 'package:Meals_App/dummy_data.dart';
import '../widgets/category_item.dart';
import "package:flutter/material.dart";

class CategoriesScreen extends StatelessWidget {
  static const routeName = "categories-screen";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: DUMMY_CATEGORIES
            .map((e) => CategoryItem(e.id, e.title, e.color))
            .toList(),
      ),
    );
  }
}
