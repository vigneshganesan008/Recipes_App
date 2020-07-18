import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final title;
  final color;

  CategoryItem(this.title, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
            colors: [color.withOpacity(0.7), color],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight),
      ),
    );
  }
}
