import 'package:deli_meal/src/models/meal_model.dart';
import 'package:deli_meal/src/navigation/tab_page.dart';
import 'package:deli_meal/src/pages/category_meal_page.dart';
import 'package:deli_meal/src/pages/filter_page.dart';
import 'package:deli_meal/src/pages/meal_details_page.dart';
import 'package:deli_meal/src/utils/dummy_data.dart';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'glutten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _availableMeal = dummyMeal;
  void _setFilterData(Map<String, bool> filterData) {
    print('Guardando los filtros');
    setState(() {
      _filters = filterData;
      _availableMeal = dummyMeal.where((meal) {
        if (_filters['glutten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

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
      home: TabPage(),
      routes: {
        CategoryMealPage.routName: (BuildContext context) =>
            CategoryMealPage(_availableMeal),
        MealDetails.routName: (BuildContext context) => MealDetails(),
        FilterPage.routeName: (BuildContext context) =>
            FilterPage(_filters, _setFilterData),
      },
    );
  }
}
