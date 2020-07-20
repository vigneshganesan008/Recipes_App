import 'package:Meals_App/widgets/meal_item.dart';
import 'package:flutter/material.dart';
import '../dummy_data.dart';

class CategoryMeals extends StatelessWidget {
  static final routeName = "category-meals";

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final id = routeArgs["id"];
    final title = routeArgs["title"];

    final categoryMeals = DUMMY_MEALS.where((element) {
      return element.categories.contains(id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
              id: categoryMeals[index].id,
              affordability: categoryMeals[index].affordability,
              complexity: categoryMeals[index].complexity,
              duration: categoryMeals[index].duration,
              imageUrl: categoryMeals[index].imageUrl,
              title: categoryMeals[index].title);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
