import 'package:flutter/material.dart';
import 'package:mobile_app_project/services/meal_service.dart';
import 'meal_detail_page.dart';

class MealListPage extends StatelessWidget {
  final String category;
  final MealService mealService = MealService();

  MealListPage(
      {required this.category}); //Kategoriye göre yemek listesi oluşturuldu

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$category Meals'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: mealService.fetchMealsByCategory(category),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final meals = snapshot.data!;
            return ListView.builder(
              itemCount: meals.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(meals[index]['strMeal']),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            MealDetailPage(mealId: meals[index]['idMeal']),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
