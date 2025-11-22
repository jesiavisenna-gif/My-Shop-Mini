import 'package:flutter/material.dart';
import '../models/product.dart';
import '../data/dummy_data.dart';
import '../controllers/auth_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../screens/home_screen.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  late TextEditingController nameController;
  late TextEditingController priceController;
  late IconData currentIcon;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.product.name);
    priceController =
        TextEditingController(text: widget.product.price.toString());
    currentIcon = widget.product.icon;
  }

  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();
    super.dispose();
  }

  // =====================================================
  // RANDOM ICON SESUAI KATEGORI
  // =====================================================
  IconData getRandomIcon(String kategori) {
    List<IconData> list = [];

    if (kategori == "Makanan") {
      list = [
        FontAwesomeIcons.burger,
        FontAwesomeIcons.pizzaSlice,
        FontAwesomeIcons.bowlRice,
        FontAwesomeIcons.drumstickBite,
        FontAwesomeIcons.breadSlice,
        FontAwesomeIcons.iceCream,
      ];
    } else if (kategori == "Minuman") {
      list = [
        FontAwesomeIcons.mugSaucer,
        FontAwesomeIcons.bottleWater,
        FontAwesomeIcons.glassWater,
        FontAwesomeIcons.martiniGlassCitrus,
        FontAwesomeIcons.wineGlass,
        FontAwesomeIcons.champagneGlasses,
      ];
    } else if (kategori == "Elektronik") {
      list = [
        FontAwesomeIcons.laptop,
        FontAwesomeIcons.mobileScreen,
        FontAwesomeIcons.headphones,
        FontAwesomeIcons.tv,
        FontAwesomeIcons.camera,
        FontAwesomeIcons.keyboard,
      ];
    }

    list.shuffle();
    return list.first;
  }

  // =====================================================
  // HAPUS ITEM
  // =====================================================
  void deleteItem() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Hapus Item"),
        content: const Text("Item ini akan dihapus. Lanjutkan?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text("Batal"),
          ),
          TextButton(
            onPressed: () {
              products.remove(widget.product);
              Navigator.pop(ctx);

              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => HomeScreen()),
                (route) => false,
              );
            },
            child: const Text("Hapus", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  // =====================================================
  // SIMPAN PERUBAHAN → balik ke HomeScreen
  // =====================================================
  void saveChanges() {
    widget.product.name = nameController.text;
    widget.product.price =
        int.tryParse(priceController.text) ?? widget.product.price;
    widget.product.icon = currentIcon;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Perubahan berhasil disimpan.")),
    );

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => HomeScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isAdmin = AuthController.isLoggedIn;

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: Text(widget.product.name),
        backgroundColor: Colors.black87,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              const SizedBox(height: 20),

              // =====================================================
              // ICON (klik random jika admin)
              // =====================================================
              GestureDetector(
                onTap: isAdmin
                    ? () {
                        setState(() {
                          currentIcon = getRandomIcon(widget.product.category);
                        });
                      }
                    : null,
                child: Icon(
                  currentIcon,
                  size: 130,
                  color: isAdmin ? Colors.orange : Colors.black87,
                ),
              ),

              const SizedBox(height: 30),

              // =====================================================
              // NAMA ITEM
              // =====================================================
              isAdmin
                  ? TextField(
                      controller: nameController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        labelText: "Nama Item",
                        border: OutlineInputBorder(),
                      ),
                    )
                  : Text(
                      widget.product.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

              const SizedBox(height: 20),

              // =====================================================
              // HARGA
              // =====================================================
              isAdmin
                  ? TextField(
                      controller: priceController,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        labelText: "Harga",
                        border: OutlineInputBorder(),
                      ),
                    )
                  : Text(
                      "Rp ${widget.product.price}",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 24),
                    ),

              const SizedBox(height: 40),

              // =====================================================
              // BUTTON ADMIN
              // =====================================================
              if (isAdmin)
                Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: saveChanges,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          padding: EdgeInsets.symmetric(vertical: 14),
                        ),
                        child: const Text(
                          "Simpan Perubahan",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: deleteItem,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          padding: EdgeInsets.symmetric(vertical: 14),
                        ),
                        child: const Text(
                          "Hapus Item",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
