import 'package:flutter/material.dart';

class Recommendations{
  late String icon;
  late String nameFood;
  late String level;
  late String time;
  late String calories;
  late Color bgCard;
  late bool viewIsSelected;

  Recommendations({
    required this.icon,
    required this.nameFood,
    required this.level,
    required this.time,
    required this.calories,
    required this.bgCard,
    required this.viewIsSelected
  });

  static List<Recommendations> getRecommendation(){
    List<Recommendations> recommendations = [];

    recommendations.add(
      Recommendations(icon: "assets/cake.svg" ,nameFood: "Honey Pancake", level: "Easy", time: "30mins", calories: "180kCal", bgCard: const Color.fromARGB(255, 121, 130, 254,),viewIsSelected: false)
    );
    recommendations.add(
      Recommendations(icon: "assets/cake.svg", nameFood: "Canai Bread", level: "Easy", time: "20mins", calories: "280kCal", bgCard: const Color.fromARGB(255, 254, 106, 237),viewIsSelected: false)
    );
    recommendations.add(
      Recommendations(icon: "assets/cake.svg" ,nameFood: "Honey Pancake", level: "Easy", time: "30mins", calories: "180kCal", bgCard: const Color.fromARGB(255, 121, 130, 254),viewIsSelected: false)
    );
    recommendations.add(
      Recommendations(icon: "assets/cake.svg", nameFood: "Canai Bread", level: "Easy", time: "20mins", calories: "280kCal", bgCard: const Color.fromARGB(255, 254, 106, 237),viewIsSelected: false)
    );
    recommendations.add(
      Recommendations(icon: "assets/cake.svg" ,nameFood: "Honey Pancake", level: "Easy", time: "30mins", calories: "180kCal", bgCard: const Color.fromARGB(255, 121, 130, 254),viewIsSelected: false)
    );
    recommendations.add(
      Recommendations(icon: "assets/cake.svg", nameFood: "Canai Bread", level: "Easy", time: "20mins", calories: "280kCal", bgCard: const Color.fromARGB(255, 254, 106, 237),viewIsSelected: false)
    );
    return recommendations;
  }
}