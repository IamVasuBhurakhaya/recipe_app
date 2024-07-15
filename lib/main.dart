import 'package:flutter/material.dart';
import 'package:recipe_app/views/screens/detail_page.dart';
import 'package:recipe_app/views/screens/home_page.dart';
import 'package:recipe_app/views/screens/meal_page.dart';
import 'package:recipe_app/views/screens/recipe_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomePage(),
        'detail_page': (context) => const DetailPage(),
        'meal_page': (context) => const MealPage(),
        'recipe_page': (context) => const RecipePage(),
      },
    );
  }
}
