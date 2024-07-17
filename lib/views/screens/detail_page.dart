import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> product =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Page"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('recipe_page');
            },
            icon: const Icon(Icons.menu_book_outlined),
          ),
          IconButton(
            onPressed: () {
              // Add to Meal Page logic
              Navigator.of(context).pushNamed('meal_page', arguments: product);
            },
            icon: const Icon(Icons.restaurant_menu),
          ),
          IconButton(
            onPressed: () {
              // Add to Favourite Page logic
              Navigator.of(context)
                  .pushNamed('favourite_page', arguments: product);
            },
            icon: const Icon(Icons.favorite_border),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image(
                  image: NetworkImage(product['image']),
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    product['name'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          offset: Offset(0, 1),
                          blurRadius: 6.0,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Card(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  leading: const Icon(Icons.timer),
                  title: const Text("Prep Time"),
                  subtitle: Text("${product['prepTimeMinutes']} minutes"),
                ),
              ),
              Card(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  leading: const Icon(Icons.timer_outlined),
                  title: const Text("Cook Time"),
                  subtitle: Text("${product['cookTimeMinutes']} minutes"),
                ),
              ),
              Card(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.people),
                      title: const Text("Servings"),
                      subtitle: Text("${product['servings']}"),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              product['servings']--;
                            });
                          },
                          icon: const Icon(
                            Icons.remove_rounded,
                          ),
                        ),
                        Text(product['servings'].toString()),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              product['servings']++;
                            });
                          },
                          icon: const Icon(
                            Icons.add_rounded,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Card(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  leading: const Icon(Icons.assignment),
                  title: const Text("Difficulty"),
                  subtitle: Text("${product['difficulty']}"),
                ),
              ),
              Card(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  leading: const Icon(Icons.restaurant),
                  title: const Text("Cuisine"),
                  subtitle: Text("${product['cuisine']}"),
                ),
              ),
              Card(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  leading: const Icon(Icons.local_fire_department),
                  title: const Text("Calories per Serving"),
                  subtitle: Text("${product['caloriesPerServing']}"),
                ),
              ),
              Card(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  leading: const Icon(Icons.tag),
                  title: const Text("Tags"),
                  subtitle: Text(product['tags'].join(", ")),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
