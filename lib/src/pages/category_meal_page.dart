import 'package:deli_meal/src/utils/dummy_data.dart';
import 'package:deli_meal/src/widgets/meal_item.dart';
import 'package:flutter/material.dart';

class CategoryMealPage extends StatelessWidget {
  static const routName = '/category-meal';
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeal = dummyMeal
        .where((meal) => meal.categories.contains(categoryId))
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: ListView.builder(
          itemBuilder: (BuildContext context, index) {
            return MealItem(
                id: categoryMeal[index].id,
                title: categoryMeal[index].title,
                affordability: categoryMeal[index].affordability,
                complexity: categoryMeal[index].complexity,
                duration: categoryMeal[index].duration,
                image: categoryMeal[index].imageUrl);
          },
          itemCount: categoryMeal.length,
        ),
      ),
    );
  }
}
