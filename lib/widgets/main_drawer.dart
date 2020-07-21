import 'package:Meals_App/screens/filters_screen.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(Icon icon, String text, Function fun) {
    return ListTile(
      leading: icon,
      title: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      ),
      onTap: fun,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 170,
            alignment: Alignment.centerLeft,
            color: Theme.of(context).primaryColor,
            child: Text(
              "Cooking Up!",
              style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontSize: 35,
                  fontWeight: FontWeight.w900),
            ),
          ),
          buildListTile(
              Icon(
                Icons.restaurant_menu,
                size: 30,
              ),
              "Meals", () {
            Navigator.of(context).pushReplacementNamed("/");
          }),
          buildListTile(
              Icon(
                Icons.filter_list,
                size: 30,
              ),
              "Filters", () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          }),
        ],
      ),
    );
  }
}
