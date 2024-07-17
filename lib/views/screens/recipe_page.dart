import 'package:flutter/material.dart';

class RecipePage extends StatefulWidget {
  const RecipePage({super.key});

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> Product =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Recipe Page"),
        backgroundColor: Colors.black.withOpacity(0.8),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('meal_page', arguments: Product);
            },
            icon: const Icon(Icons.restaurant_menu),
          ),
          IconButton(
            onPressed: () {
              // Add to Favourite Page logic
              Navigator.of(context)
                  .pushNamed('favourite_page', arguments: Product);
            },
            icon: const Icon(Icons.favorite_border),
          ),
        ],
      ),
      backgroundColor: const Color(0xFF212121),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const Text(
              "Ingredients",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Column(
              children: (Product['ingredients'] as List<dynamic>)
                  .map<Widget>((ingredient) {
                return Card(
                  color: Colors.white.withOpacity(0.1),
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.check_circle_outline,
                        color: Colors.white),
                    title: Text(
                      ingredient,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 32),
            const Text(
              "Instructions",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Column(
              children: (Product['instructions'] as List<dynamic>)
                  .map<Widget>((instruction) {
                return Card(
                  color: Colors.white.withOpacity(0.1),
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.format_list_numbered,
                        color: Colors.white),
                    title: Text(
                      instruction,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
