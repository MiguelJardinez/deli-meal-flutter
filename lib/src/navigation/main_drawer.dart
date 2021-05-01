import 'package:deli_meal/src/pages/filter_page.dart';
import 'package:flutter/material.dart';

class DrawerMain extends StatelessWidget {
  Widget buildListTile(
      BuildContext context, String title, IconData icon, String routName) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
      onTap: () {
        Navigator.of(context).pushReplacementNamed('$routName');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              height: 120,
              width: double.infinity,
              padding: EdgeInsets.all(20),
              alignment: Alignment.centerLeft,
              color: Theme.of(context).accentColor,
              child: Text(
                'Coocling up!',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 32,
                    color: Theme.of(context).primaryColor),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            buildListTile(
              context,
              'Meal',
              Icons.restaurant,
              '/',
            ),
            buildListTile(
              context,
              'Filters',
              Icons.settings,
              FilterPage.routeName,
            ),
          ],
        ),
      ),
    );
  }
}
