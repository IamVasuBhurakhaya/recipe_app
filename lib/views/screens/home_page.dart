import 'dart:js_interop';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:recipe_app/utils/recipe_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selected = "All";
  String selectedDifficulty = "AllLevel";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home Page",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('meal_page');
              },
              icon: const Icon(Icons.foggy)),
          const SizedBox(
            width: 10,
          ),
          const Icon(Icons.favorite_rounded),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Row(
                children: [
                  //cuisine
                  DropdownButton(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        10,
                      ),
                    ),
                    padding: const EdgeInsets.all(3),
                    value: selected,
                    onChanged: (val) {
                      setState(() {
                        selected = val.toString();
                      });
                    },
                    items: [
                      const DropdownMenuItem(
                        value: "All",
                        child: Text("All Cuisine"),
                      ),
                      ...allCuisine.map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ),
                      ),
                    ],
                  ),
                  //difficulty
                  Visibility(
                    visible: selected != "All",
                    child: DropdownButton(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          10,
                        ),
                      ),
                      // focusColor: Colors.green,
                      padding: const EdgeInsets.all(3),
                      value: selectedDifficulty,
                      onChanged: (val) {
                        setState(() {
                          selectedDifficulty = val.toString();
                        });
                      },
                      items: [
                        const DropdownMenuItem(
                          value: "AllLevel",
                          child: Text("Difficulty Level"),
                        ),
                        ...allDifficulty.map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: allRecipes
                    .where((e) => selected == "All"
                        ? true
                        : selected == e['cuisine'] &&
                            selectedDifficulty == e['difficulty'])
                    .map(
                      (e) => GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed('detail_page', arguments: e);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          margin: const EdgeInsets.only(
                            bottom: 16,
                          ),
                          height: size.height * 0.45,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(16),
                            ),
                            border: Border.all(
                              color: Colors.white,
                            ),
                          ),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.network(
                                  e['image'],
                                  height: size.height * 0.45,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                bottom: 16,
                                left: 16,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.7),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    e['name'],
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
                              ),
                              Positioned(
                                top: 16,
                                right: 16,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.7),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.timer,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        "${e['prepTimeMinutes'] + e['cookTimeMinutes']} min",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          shadows: [
                                            Shadow(
                                              offset: const Offset(0, 1),
                                              blurRadius: 6.0,
                                              color:
                                                  Colors.black.withOpacity(0.8),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 16,
                                right: 16,
                                child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 6, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.7),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          mealItem.add(e);
                                          e['qty'] = 1;
                                        });
                                      },
                                      icon: const Icon(Icons.add),
                                      color: Colors.white,
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
