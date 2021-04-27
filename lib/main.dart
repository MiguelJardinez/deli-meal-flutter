import 'package:deli_meal/src/pages/category_meal_page.dart';
import 'package:deli_meal/src/pages/catetegories_page.dart';
import 'package:deli_meal/src/pages/meal_details_page.dart';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Deli meal',
      theme: ThemeData(
        primaryColor: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              title: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold),
            ),
      ),
      home: CategoryPage(),
      routes: {
        CategoryMealPage.routName: (BuildContext context) => CategoryMealPage(),
        MealDetails.routName: (BuildContext context) => MealDetails(),
      },
    );
  }
}
