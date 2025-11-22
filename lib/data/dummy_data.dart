import 'package:flutter/material.dart';
import '../models/category.dart';
import '../models/product.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final categories = [
  Category("Makanan", Icons.fastfood),
  Category("Minuman", Icons.local_drink),
  Category("Elektronik", Icons.devices),
];

/// ! PENTING: gunakan List biasa agar bisa ditambah/dihapus
List<Product> products = [

  // ============================
  // Makanan
  // ============================
  Product("Burger", Icons.fastfood, 25000, "Makanan"),
  Product("Ayam Goreng", Icons.local_pizza, 30000, "Makanan"),
  Product("Nasi Goreng", Icons.rice_bowl, 20000, "Makanan"),
  Product("Mie Ayam", Icons.ramen_dining, 18000, "Makanan"),
  Product("Sate Ayam", Icons.restaurant, 25000, "Makanan"),
  Product("Bakso", Icons.local_dining, 15000, "Makanan"),
  Product("Pizza Slice", Icons.local_pizza, 22000, "Makanan"),
  Product("Kentang Goreng", Icons.lunch_dining, 12000, "Makanan"),
  Product("Donat", Icons.cake, 8000, "Makanan"),
  Product("Roti Bakar", Icons.bakery_dining, 12000, "Makanan"),
  Product("Kebab", Icons.fastfood, 17000, "Makanan"),
  Product("Sandwich", Icons.lunch_dining, 14000, "Makanan"),

  // ============================
  // Minuman
  // ============================
  Product("Kopi Hitam", Icons.coffee, 12000, "Minuman"),
  Product("Teh Manis", Icons.local_drink, 8000, "Minuman"),
  Product("Jus Jeruk", Icons.local_drink, 15000, "Minuman"),
  Product("Susu Coklat", Icons.icecream, 13000, "Minuman"),
  Product("Es Teh", Icons.local_drink, 9000, "Minuman"),
  Product("Es Kopi Susu", Icons.coffee_rounded, 18000, "Minuman"),
  Product("Matcha Latte", Icons.local_cafe, 20000, "Minuman"),
  Product("Mineral Water", Icons.water_drop, 5000, "Minuman"),
  Product("Soda", Icons.local_bar, 10000, "Minuman"),
  Product("Milkshake", Icons.blender, 15000, "Minuman"),
  Product("Thai Tea", Icons.local_cafe, 14000, "Minuman"),
  Product("Cappuccino", Icons.local_cafe_outlined, 18000, "Minuman"),

  // ============================
  // Elektronik
  // ============================
  Product("Laptop", Icons.computer, 6000000, "Elektronik"),
  Product("HP Android", Icons.phone_android, 3000000, "Elektronik"),
  Product("Keyboard", Icons.keyboard, 300000, "Elektronik"),
  Product("Mouse", Icons.mouse, 150000, "Elektronik"),
  Product("Headset", Icons.headset, 250000, "Elektronik"),
  Product("Smartwatch", Icons.watch, 500000, "Elektronik"),
  Product("Tablet", Icons.tablet, 2500000, "Elektronik"),
  Product("Charger", Icons.bolt, 100000, "Elektronik"),
  Product("USB Flashdisk", Icons.usb, 80000, "Elektronik"),
  Product("Router WiFi", Icons.router, 400000, "Elektronik"),
  Product("TV LED", Icons.tv, 3500000, "Elektronik"),
  Product("Speaker Bluetooth", Icons.speaker, 450000, "Elektronik"),
];
