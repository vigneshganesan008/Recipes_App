import 'package:Meals_App/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static final routeName = "filters-screen";

  final Map<String, bool> currentFilters;
  final Function saveFilter;
  FiltersScreen(this.currentFilters, this.saveFilter);
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool glutenFree = false;

  bool lactoseFree = false;

  bool vegan = false;

  bool veg = false;

  @override
  initState() {
    glutenFree = widget.currentFilters["Gluten"];
    lactoseFree = widget.currentFilters["Lactose"];
    vegan = widget.currentFilters["Vegan"];
    veg = widget.currentFilters["Veg"];

    super.initState();
  }

  Widget buildSwitchListTile(
      String title, String sTitle, bool currenState, Function changeState) {
    return SwitchListTile.adaptive(
      value: currenState,
      onChanged: changeState,
      title: Text(title),
      subtitle: Text(sTitle),
      activeColor: Theme.of(context).accentColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filters"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              widget.saveFilter({
                "Gluten": glutenFree,
                "Lactose": lactoseFree,
                "Vegan": vegan,
                "Veg": veg,
              });
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            height: 100,
            alignment: Alignment.center,
            child: Text(
              "Adjust Your Meal Preference",
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
            ),
          ),
          buildSwitchListTile(
            "Gluten-Free",
            "Only Gluten-Free Meals will be shown",
            glutenFree,
            (val) {
              setState(() {
                glutenFree = val;
              });
            },
          ),
          buildSwitchListTile(
            "Lactose-Free",
            "Only Loctose-Free Meals will be shown",
            lactoseFree,
            (val) {
              setState(() {
                lactoseFree = val;
              });
            },
          ),
          buildSwitchListTile(
            "Vegan",
            "Only Vegan Meals will be shown",
            vegan,
            (val) {
              setState(() {
                vegan = val;
              });
            },
          ),
          buildSwitchListTile(
            "Veg",
            "Only Veg Meals will be shown",
            veg,
            (val) {
              setState(() {
                veg = val;
              });
            },
          ),
        ],
      ),
    );
  }
}
