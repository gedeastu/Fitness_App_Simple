import 'package:flutter/material.dart';

class Category{
  late String name;
  late String icon;
  late Color boxColor;
  late bool condition;

  Category({
    required this.name,
    required this.icon,
    required this.boxColor,
    required this.condition
  });

  static List<Category> getCategories(){
    List<Category> categories = [];

    categories.add(
      Category(name: "Salad", icon: 'assets/salad.svg', boxColor: const Color.fromARGB(255, 121, 130, 254),condition: false)
    );

    categories.add(
      Category(name: "Cake", icon: 'assets/cake.svg', boxColor: const Color.fromARGB(255, 254, 106, 237),condition: false)
    );

    categories.add(
      Category(name: "Pie", icon: 'assets/pie.svg', boxColor: const Color.fromARGB(255, 121, 130, 254),condition: false)
    );

    categories.add(
      Category(name: "Smoothie", icon: 'assets/fruit.svg', boxColor: const Color.fromARGB(255, 254, 106, 237),condition: false)
    ); 

    return categories;
  }
}