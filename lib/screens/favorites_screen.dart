import 'package:Meals_App/models/meal.dart';
import 'package:Meals_App/widgets/meal_item.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  static final routeName = "favorite-screen";
  final List<Meal> favoriteMeals;
  FavoriteScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text("You have not marked any meals as you favorite!"),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
              id: favoriteMeals[index].id,
              affordability: favoriteMeals[index].affordability,
              complexity: favoriteMeals[index].complexity,
              duration: favoriteMeals[index].duration,
              imageUrl: favoriteMeals[index].imageUrl,
              title: favoriteMeals[index].title);
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
