import 'package:Meals_App/screens/categories_screen.dart';
import 'package:Meals_App/screens/favorites_screen.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> pages = [
    {"page": CategoriesScreen(), "title": "Categories"},
    {"page": FavoriteScreen(), "title": "Your Favorites"}
  ];

  int selectedPageIndex = 0;
  void selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pages[selectedPageIndex]["title"]),
      ),
      body: pages[selectedPageIndex]["page"],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text(
              "Categories",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            backgroundColor: Theme.of(context).primaryColor,
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.star),
              title: Text(
                "Favorites",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              backgroundColor: Theme.of(context).primaryColor),
        ],
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: selectedPageIndex,
        onTap: selectPage,
        type: BottomNavigationBarType.shifting,
      ),
    );
  }
}
