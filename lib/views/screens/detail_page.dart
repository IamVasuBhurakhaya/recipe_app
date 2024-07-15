import 'package:flutter/material.dart';
import 'package:recipe_app/views/screens/home_page.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> Product =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Page"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('recipe_page');
            },
            icon: Icon(Icons.menu_book_outlined),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image(
              image: NetworkImage(
                Product['image'],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    10,
                  ),
                ),
              ),
              child: Text(
                Product['name'],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      offset: const Offset(0, 1),
                      blurRadius: 6.0,
                      color: Colors.black.withOpacity(0.8),
                    ),
                  ],
                ),
              ),
            ),
            Text("prepTimeMinutes :${Product['prepTimeMinutes']}".toString()),
            Text("cookTimeMinutes: ${Product['cookTimeMinutes']}".toString()),
            Text("servings: ${Product['servings']}".toString()),
            Text("difficulty: ${Product['difficulty']}".toString()),
            Text("cuisine: ${Product['cuisine']}".toString()),
            Text("caloriesPerServing: ${Product['caloriesPerServing']}"
                .toString()),
            Text("tags: ${Product['tags']}".toString()),
          ],
        ),
      ),
    );
  }
}
