import 'dart:convert';
import 'package:appcsmju/model/carouselmodel/reship.dart';

import 'package:http/http.dart' as http;

class RecipeApi {
  
  static Future<List<Recipe>> getRecipe() async {
    

    final response = await http.get(Uri.parse("https://wwwdev.csmju.com/api/activity"));

    if(response.statusCode == 200){
        return recipeFromJson(response.body);
      }
      print('API GET1');
      return getRecipe();
    

    

    
  }
}