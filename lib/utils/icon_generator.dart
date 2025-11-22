import 'package:flutter/material.dart';

class IconGenerator {
  static final makananIcons = [
    Icons.fastfood,
    Icons.lunch_dining,
    Icons.ramen_dining,
    Icons.cake,
  ];

  static final minumanIcons = [
    Icons.local_drink,
    Icons.coffee,
    Icons.icecream,
    Icons.wine_bar,
  ];

  static final elektronikIcons = [
    Icons.computer,
    Icons.phone_android,
    Icons.headphones,
    Icons.tv,
  ];

  static IconData random(String category) {
    final list = category == "Makanan"
        ? makananIcons
        : category == "Minuman"
            ? minumanIcons
            : elektronikIcons;

    list.shuffle();
    return list.first;
  }
}
