import 'package:flutter/material.dart';

class RecipePage extends StatefulWidget {
  const RecipePage({super.key});

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    Map<String, dynamic> Product =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Text(
              "ingredients :${Product['ingredients'] ?? "No Ingrediants mention for this recipe"}"),
          SizedBox(
            height: 100,
          ),
          Text(
              "Steps :${Product['instructions'] ?? "No steps for this Recipe"}"),
        ],
      ),
    );
  }
}
