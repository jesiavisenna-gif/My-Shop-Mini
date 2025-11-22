import 'package:flutter/material.dart';
import 'screens/start_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyShopMini());
}

class MyShopMini extends StatelessWidget {
  const MyShopMini({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyShop Mini',
      debugShowCheckedModeBanner: false,
      home: const StartScreen(), // ← halaman pertama
    );
  }
}
