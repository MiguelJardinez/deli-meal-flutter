import 'package:flutter/material.dart';

class CategoryMealPage extends StatelessWidget {
  static const routName = '/category-meal';
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    print(routeArgs);
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: Text('Meal Page'),
      ),
    );
  }
}
