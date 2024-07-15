import 'package:flutter/material.dart';
import 'package:recipe_app/utils/recipe_utils.dart';

class MealPage extends StatefulWidget {
  const MealPage({super.key});

  @override
  State<MealPage> createState() => _MealPageState();
}

class _MealPageState extends State<MealPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meal Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: mealItem.isEmpty
            ? const Center(
                child: Text("Empty"),
              )
            : Column(
                children: [
                  ...mealItem
                      .map(
                        (e) => Column(
                          children: [
                            Row(
                              children: [
                                Text(e['name'].toString()),
                                const SizedBox(
                                  width: 16,
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                      .toList(),
                ],
              ),
      ),
    );
  }
}
