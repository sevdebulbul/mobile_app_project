import 'package:flutter/material.dart';
import 'package:mobile_app_project/pages/category_page.dart';

void main() {
  runApp(MealRecipeApp());
}

class MealRecipeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Recipe App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CategoryPage(),
    );
  }
}
