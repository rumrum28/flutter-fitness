import "package:flutter/material.dart";

class CategoryModel {
  String name;
  String iconPath;
  Color boxColor;

  CategoryModel({
    required this.name,
    required this.iconPath,
    required this.boxColor,
  });

  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];

    categories.add(
      CategoryModel(
        name: 'Salad',
        iconPath: 'assets/icons/plate.svg',
        boxColor: Color(0xff92A3FD),
      ),
    );

    categories.add(
      CategoryModel(
        name: 'Cake',
        iconPath: 'assets/icons/cake.svg',
        boxColor: Color.fromARGB(255, 253, 150, 146),
      ),
    );

    categories.add(
      CategoryModel(
        name: 'Pie',
        iconPath: 'assets/icons/pie.svg',
        boxColor: Color.fromARGB(255, 153, 146, 253),
      ),
    );

    categories.add(
      CategoryModel(
        name: 'Orange Snack',
        iconPath: 'assets/icons/orange-snacks.svg',
        boxColor: Color.fromARGB(255, 253, 146, 248),
      ),
    );

    return categories;
  }
}
