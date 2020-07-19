import 'package:Meals_App/screens/categoryMeals_screen.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final title;
  final color;
  final id;

  CategoryItem(this.id, this.title, this.color);

  selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(CategoryMeals.routeName,
        arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => selectCategory(context),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
              colors: [color.withOpacity(0.7), color],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight),
        ),
      ),
    );
  }
}
