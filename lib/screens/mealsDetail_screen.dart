import 'package:Meals_App/dummy_data.dart';
import 'package:flutter/material.dart';

class MealsDetails extends StatelessWidget {
  static const routeName = "mealsDetail";

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((element) => element.id == id);

    Widget buildCard(String text) {
      return Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        margin: EdgeInsets.only(top: 15),
      );
    }

    Widget buildContainerList(Widget child) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        height: 150,
        width: 300,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: child,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("${selectedMeal.title}"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300,
              ),
            ),
            buildCard("Ingredients"),
            buildContainerList(ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(
                      selectedMeal.ingredients[index],
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                );
              },
              itemCount: selectedMeal.ingredients.length,
            )),
            buildCard("Steps"),
            buildContainerList(
              ListView.builder(
                itemCount: selectedMeal.steps.length,
                itemBuilder: (ctx, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context).accentColor,
                      child: Text(
                        "#${index + 1}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    title: Text("${selectedMeal.steps[index]}"),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
