import 'package:Meals_App/screens/categories_screen.dart';
import 'package:Meals_App/screens/categoryMeals_screen.dart';
import 'package:Meals_App/screens/filters_screen.dart';
import 'package:Meals_App/screens/mealsDetail_screen.dart';
import 'package:Meals_App/screens/tabs_screen.dart';
import "package:flutter/material.dart";

import 'dummy_data.dart';
import 'models/meal.dart';

main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    "Gluten": false,
    "Lactose": false,
    "Vegan": false,
    "Veg": false,
  };

  List<Meal> avaliableMeals = DUMMY_MEALS;
  setFilters(Map<String, bool> filterData) {
    setState(() {
      filters = filterData;

      avaliableMeals = DUMMY_MEALS.where((e) {
        if (filters["Gluten"] && !e.isGlutenFree) return false;
        if (filters["Lactose"] && !e.isLactoseFree) return false;
        if (filters["Vegan"] && !e.isVegan) return false;
        if (filters["Veg"] && !e.isVegetarian) return false;
        return true;
      }).toList();
    });
  }

  List<Meal> favoriteMeals = [];
  toggleFavorite(String mealId) {
    final existsIndex =
        favoriteMeals.indexWhere((element) => element.id == mealId);
    if (existsIndex >= 0) {
      setState(() {
        favoriteMeals.removeAt(existsIndex);
      });
    } else {
      setState(() {
        favoriteMeals
            .add(DUMMY_MEALS.firstWhere((element) => element.id == mealId));
      });
    }
  }

  bool isFavorite(String mealId) {
    return favoriteMeals.any((element) => element.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Meals App",
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.deepOrange,
        accentColor: Colors.yellow,
        fontFamily: "Raleway",
        textTheme: ThemeData.dark().textTheme.copyWith(
              bodyText1: TextStyle(color: Colors.white),
              bodyText2: TextStyle(
                color: Colors.white,
              ),
              headline6: TextStyle(
                  fontSize: 20,
                  fontFamily: "RobotoComdensed",
                  fontWeight: FontWeight.bold),
            ),
      ),
      routes: {
        "/": (_) => TabsScreen(favoriteMeals),
        CategoriesScreen.routeName: (_) => CategoriesScreen(),
        CategoryMeals.routeName: (_) => CategoryMeals(avaliableMeals),
        FiltersScreen.routeName: (_) => FiltersScreen(filters, setFilters),
        MealsDetails.routeName: (_) => MealsDetails(toggleFavorite, isFavorite),
      },
    );
  }
}
