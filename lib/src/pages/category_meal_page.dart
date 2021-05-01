import 'package:deli_meal/src/models/meal_model.dart';
import 'package:deli_meal/src/utils/dummy_data.dart';
import 'package:deli_meal/src/widgets/meal_item.dart';
import 'package:flutter/material.dart';

class CategoryMealPage extends StatefulWidget {
  static const routName = '/category-meal';
  final List<Meal> availableMeal;

  CategoryMealPage(this.availableMeal);

  @override
  _CategoryMealPageState createState() => _CategoryMealPageState();
}

class _CategoryMealPageState extends State<CategoryMealPage> {
  String categoryTitle;
  List<Meal> displayedMeal;
  bool _loadedInitData = false;

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      displayedMeal = widget.availableMeal
          .where((meal) => meal.categories.contains(categoryId))
          .toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  _removeMeal(String mealId) {
    setState(() {
      displayedMeal.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: ListView.builder(
          itemBuilder: (BuildContext context, index) {
            return MealItem(
              id: displayedMeal[index].id,
              title: displayedMeal[index].title,
              affordability: displayedMeal[index].affordability,
              complexity: displayedMeal[index].complexity,
              duration: displayedMeal[index].duration,
              image: displayedMeal[index].imageUrl,
              removeItem: _removeMeal,
            );
          },
          itemCount: displayedMeal.length,
        ),
      ),
    );
  }
}
