import 'package:flutter/material.dart';
import 'package:red_tape/Models/global.dart';

class CategoryCard extends StatelessWidget {
  final String categoryName;
  final Icon categoryIcon;
  const CategoryCard({Key key, this.categoryName, this.categoryIcon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 5)
              ],
              color: blueColor
            ),
            child: categoryIcon
          ),
          Container(
            child: Center(child: Text(categoryName, style: categoryTitle),)
          )
        ]
      )
    );
  }
}