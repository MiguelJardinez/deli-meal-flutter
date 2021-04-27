import 'package:deli_meal/src/utils/dummy_data.dart';
import 'package:deli_meal/src/widgets/category_item.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  static const routName = '/';
  const CategoryPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          mainAxisExtent: 150,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          maxCrossAxisExtent: 200.0,
        ),
        children: dummyData
            .map((category) =>
                CategoryItem(category.id, category.title, category.color))
            .toList(),
      ),
    );
  }
}
