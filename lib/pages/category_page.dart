import 'package:flutter/material.dart';
import 'package:mobile_app_project/pages/meal_list_page.dart';

class CategoryPage extends StatelessWidget {
  final List<String> categories = [
    'Seafood',
    'Desserts'
  ]; //Kategoriler burada gösterildi

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal Categories'),
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(categories[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      MealListPage(category: categories[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
