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
        title: const Text("Meal Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: mealItem.isEmpty
            ? const Center(
                child: Text("Empty"),
              )
            : ListView.builder(
                itemCount: mealItem.length,
                itemBuilder: (context, index) {
                  final item = mealItem[index];
                  return Card(
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16),
                      leading: Image.network(
                        item['imageUrl'].toString(),
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      title: Text(
                        item['name'].toString(),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 8),
                          Text(
                            item['description'].toString(),
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Prep Time: ${item['prepTime']} mins',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.favorite_border),
                        onPressed: () {
                          // Handle favorite button press
                        },
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
