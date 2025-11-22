import 'package:flutter/material.dart';

class Product {
  String name;
  IconData icon;
  int price;
  final String category;

  Product(this.name, this.icon, this.price, this.category);
}
