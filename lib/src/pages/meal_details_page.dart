import 'package:deli_meal/src/utils/dummy_data.dart';
import 'package:flutter/material.dart';

class MealDetails extends StatelessWidget {
  static const routName = '/meal-details';

  Widget buildSectionTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 300,
      width: 350,
      child: child,
    );
  }

  Widget buildList(List list) {
    return ListView.builder(
      itemBuilder: (BuildContext context, index) {
        return Card(
          color: Theme.of(context).accentColor,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Text(list[index]),
          ),
        );
      },
      itemCount: list.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealID = ModalRoute.of(context).settings.arguments as String;
    print(mealID);
    final meal = dummyMeal.firstWhere((meal) => meal.id == mealID);
    return Scaffold(
      appBar: AppBar(
        title: Text('${meal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildContainer(buildList(meal.ingredients)),
            buildSectionTitle(context, 'Steps'),
            buildContainer(ListView.builder(
              itemBuilder: (BuildContext context, index) {
                return ListTile(
                  leading: CircleAvatar(child: Text('${(index + 1)}')),
                  title: Text(meal.steps[index]),
                );
              },
              itemCount: meal.steps.length,
            )),
          ],
        ),
      ),
    );
  }
}
