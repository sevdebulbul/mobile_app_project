import 'dart:convert';
import 'package:http/http.dart' as http;

class MealService {
  static const String _baseUrl =
      'https://www.themealdb.com/api/json/v1/1'; //API adresi burada belirtildi

  Future<List<dynamic>> fetchMealsByCategory(String category) async {
    //Kategoriye göre yemek listesi burada oluşturuldu
    final response = await http.get(
        Uri.parse('$_baseUrl/filter.php?c=$category')); //APIden veri çekildi
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['meals'];
    } else {
      throw Exception('Failed to load meals');
    }
  }

  Future<Map<String, dynamic>> fetchMealDetails(String id) async {
    final response = await http.get(Uri.parse('$_baseUrl/lookup.php?i=$id'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['meals'][0];
    } else {
      throw Exception('Failed to load meal details');
    }
  }
}
