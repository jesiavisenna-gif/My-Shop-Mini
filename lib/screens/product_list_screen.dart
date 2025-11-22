import 'package:flutter/material.dart';
import 'package:uts_pemrograman_mobile/models/product.dart';
import '../models/category.dart';
import '../data/dummy_data.dart';
import 'product_detail_screen.dart';
import '../widgets/growtopia_slot.dart';
import '../widgets/growtopia_background.dart';
import '../widgets/growtopia_back_button.dart';
import '../controllers/auth_controller.dart';
import 'dart:math';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductListScreen extends StatefulWidget {
  final Category category;

  const ProductListScreen({super.key, required this.category});

  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  /// Generate icon random per kategori
  IconData getRandomIcon(String category) {
    final random = Random();

    if (category == "Makanan") {
      const list = [
        Icons.fastfood,
        Icons.local_pizza,
        Icons.ramen_dining,
        Icons.lunch_dining,
        Icons.restaurant,
        Icons.donut_small,
      ];
      return list[random.nextInt(list.length)];
    }

    if (category == "Minuman") {
      const list = [
        Icons.local_drink,
        Icons.coffee,
        Icons.coffee_rounded,
        Icons.local_cafe,
        Icons.blender,
      ];
      return list[random.nextInt(list.length)];
    }

    // Elektronik
    const list = [
      Icons.phone_android,
      Icons.computer,
      Icons.tv,
      Icons.router,
      Icons.keyboard,
      Icons.mouse,
      Icons.bolt,
    ];
    return list[random.nextInt(list.length)];
  }

  /// Popup tambah item
  void _showAddItemDialog() {
    final nameController = TextEditingController();
    final priceController = TextEditingController();

    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text("Tambah Item Baru"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: "Nama Item"),
              ),
              TextField(
                controller: priceController,
                decoration: InputDecoration(labelText: "Harga"),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text("Batal"),
              onPressed: () => Navigator.pop(context),
            ),
            ElevatedButton(
              child: Text("Tambah"),
              onPressed: () {
                final nama = nameController.text.trim();
                final harga = int.tryParse(priceController.text) ?? 0;

                if (nama.isEmpty || harga <= 0) return;

                products.add(
                  Product(
                    nama,
                    getRandomIcon(widget.category.name),
                    harga,
                    widget.category.name,
                  ),
                );

                Navigator.pop(context);

                setState(() {});

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Item berhasil ditambahkan!"),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final filtered = products
        .where((p) => p.category == widget.category.name)
        .toList();

    return Scaffold(
      backgroundColor: Colors.transparent,

      body: GrowtopiaBackground(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // =====================================================
              // TOMBOL BACK + TITLE + TOMBOL TAMBAH
              // =====================================================
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 15, right: 20),
                child: Row(
                  children: [
                    GrowtopiaBackButton(
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),

                    SizedBox(width: 15),

                    Expanded(
                      child: Text(
                        "${widget.category.name} Vending",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              blurRadius: 6,
                              color: Colors.black,
                              offset: Offset(2, 2),
                            ),
                          ],
                        ),
                      ),
                    ),

                    /// Tombol tambah (+) hanya untuk admin
                    if (AuthController.isLoggedIn)
                      GestureDetector(
                        onTap: _showAddItemDialog,
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.black, width: 2),
                          ),
                          child: Icon(Icons.add, color: Colors.green, size: 28),
                        ),
                      ),
                  ],
                ),
              ),

              SizedBox(height: 10),

              // =====================================================
              // GRID LIST 3 kolom
              // =====================================================
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(20),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,    
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 0.85,
                  ),
                  itemCount: filtered.length,
                  itemBuilder: (context, index) {
                    final product = filtered[index];

                    return GrowtopiaVendingSlot(
                      product: product,
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration: Duration(milliseconds: 350),
                            pageBuilder: (_, animation, __) =>
                                ProductDetailScreen(product: product),
                            transitionsBuilder:
                                (_, animation, __, child) {
                              final tween = Tween(
                                begin: Offset(1.0, 0.0),
                                end: Offset.zero,
                              ).chain(CurveTween(curve: Curves.easeOutCubic));

                              return SlideTransition(
                                position: animation.drive(tween),
                                child: child,
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
