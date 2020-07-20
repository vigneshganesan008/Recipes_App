import 'package:Meals_App/screens/categoryMeals_screen.dart';
import 'package:Meals_App/screens/mealsDetail_screen.dart';
import 'package:Meals_App/screens/tabs_screen.dart';
import "package:flutter/material.dart";

main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                  fontSize: 20,
                  fontFamily: "RobotoComdensed",
                  fontWeight: FontWeight.bold),
            ),
      ),
      routes: {
        "/": (_) => TabsScreen(),
        CategoryMeals.routeName: (_) => CategoryMeals(),
        MealsDetails.routeName: (_) => MealsDetails(),
      },
    );
  }
}
