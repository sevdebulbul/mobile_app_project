import 'package:flutter/material.dart';
import 'package:mobile_app_project/services/meal_service.dart';

class MealDetailPage extends StatelessWidget {
  final String mealId;
  final MealService mealService = MealService();

  MealDetailPage({required this.mealId}); //Yemek detayları burada gösterildi
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe Details'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: mealService.fetchMealDetails(mealId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final meal = snapshot.data!;
            return Padding(
              padding: EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  Text(
                    meal['strMeal'],
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Image.network(meal['strMealThumb']),
                  SizedBox(height: 10),
                  Text(meal['strInstructions']),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
