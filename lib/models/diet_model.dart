import "package:flutter/material.dart";

class DietModel {
  String name;
  String iconPath;
  String level;
  String duration;
  String calorie;
  Color boxColor;
  bool viewIsSelected;

  DietModel({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calorie,
    required this.viewIsSelected,
    required this.boxColor,
  });

  static List<DietModel> getDiets() {
    List<DietModel> diets = [];

    diets.add(
      DietModel(
        name: 'Honey Pancake',
        iconPath: 'assets/icons/cake.svg',
        level: 'Easy',
        duration: '30mins',
        calorie: '180Cal',
        boxColor: const Color.fromARGB(255, 253, 168, 162),
        viewIsSelected: true,
      ),
    );

    diets.add(
      DietModel(
        name: 'Honey Pancake',
        iconPath: 'assets/icons/cake.svg',
        level: 'Easy',
        duration: '30mins',
        calorie: '180Cal',
        boxColor: const Color.fromARGB(255, 253, 162, 248),
        viewIsSelected: false,
      ),
    );

    return diets;
  }
}
