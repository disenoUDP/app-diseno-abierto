import 'package:flutter/material.dart';

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
        name: 'Ensalada',
        iconPath: 'assets/iconos/plate.svg',
        boxColor: const Color(0xff92A3FD)
      )
    );

    categories.add(
      CategoryModel(
        name: 'Pastel',
        iconPath: 'assets/iconos/pancakes.svg',
        boxColor: const Color(0xff92A3F2)
      )
    );

    categories.add(
      CategoryModel(
        name: 'Pie',
        iconPath: 'assets/iconos/pie.svg',
        boxColor: const Color(0xff92A3FD)
      )
    );

    categories.add(
      CategoryModel(
        name: 'Batidos',
        iconPath: 'assets/iconos/orange-snacks.svg',
        boxColor: const Color(0xff92A3F2)
      )
    );

    return categories;
  }
}