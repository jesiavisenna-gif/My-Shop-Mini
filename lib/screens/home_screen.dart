import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../controllers/auth_controller.dart';
import '../widgets/growtopia_background.dart';
import '../widgets/growtopia_menu_button.dart';
import 'product_list_screen.dart';
import 'start_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // =====================================================
  // FUNCTION: Handle tombol back (logout untuk moderator)
  // =====================================================
  void _handleBack(BuildContext context) {
    if (AuthController.isLoggedIn == false) {
      // USER BIASA → langsung kembali ke StartScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const StartScreen()),
      );
      return;
    }

    // MODERATOR → tampilkan Alert Logout
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text("Keluar?"),
          content: const Text(
            "Anda akan logout dari akun moderator. Lanjutkan?",
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx), // batal
              child: const Text("Batal"),
            ),
            TextButton(
              onPressed: () {
                AuthController.logout();
                Navigator.pop(ctx);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const StartScreen()),
                );
              },
              child: const Text(
                "Logout",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final moderator = AuthController.isLoggedIn;

    return Scaffold(
      body: GrowtopiaBackground(
        child: SafeArea(
          child: Stack(
            children: [
              // =====================================================
              // TOMBOL BACK KECIL (KIRI ATAS)
              // =====================================================
              Positioned(
                top: 10,
                left: 10,
                child: GestureDetector(
                  onTap: () => _handleBack(context),
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.arrow_back, color: Colors.black),
                  ),
                ),
              ),

              // =====================================================
              // KONTEN UTAMA
              // =====================================================
              Column(
                children: [
                  const SizedBox(height: 30),

                  // TITLE (berubah jika moderator)
                  Text(
                    moderator ? "Hello, @Moderator" : "MyShop Mini",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: moderator ? Colors.orange : Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 6,
                          color: Colors.black,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // POSISI TOMBOL SUB-MENU
                  const SizedBox(height: 160),

                  // BUTTON: Makanan
                  GrowtopiaMenuButton(
                    icon: Icons.fastfood,
                    label: "Makanan",
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          transitionDuration: const Duration(milliseconds: 350),
                          pageBuilder: (_, animation, __) =>
                              ProductListScreen(category: categories[0]),
                          transitionsBuilder: (_, animation, __, child) {
                            final tween = Tween(
                              begin: const Offset(1.0, 0.0),
                              end: Offset.zero,
                            ).chain(
                              CurveTween(curve: Curves.easeOutCubic),
                            );
                            return SlideTransition(
                              position: animation.drive(tween),
                              child: child,
                            );
                          },
                        ),
                      );
                    },
                  ),

                  // BUTTON: Minuman
                  GrowtopiaMenuButton(
                    icon: Icons.local_drink,
                    label: "Minuman",
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          transitionDuration: const Duration(milliseconds: 350),
                          pageBuilder: (_, animation, __) =>
                              ProductListScreen(category: categories[1]),
                          transitionsBuilder: (_, animation, __, child) {
                            final tween = Tween(
                              begin: const Offset(1.0, 0.0),
                              end: Offset.zero,
                            ).chain(
                              CurveTween(curve: Curves.easeOutCubic),
                            );
                            return SlideTransition(
                              position: animation.drive(tween),
                              child: child,
                            );
                          },
                        ),
                      );
                    },
                  ),

                  // BUTTON: Elektronik
                  GrowtopiaMenuButton(
                    icon: Icons.devices,
                    label: "Elektronik",
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          transitionDuration: const Duration(milliseconds: 350),
                          pageBuilder: (_, animation, __) =>
                              ProductListScreen(category: categories[2]),
                          transitionsBuilder: (_, animation, __, child) {
                            final tween = Tween(
                              begin: const Offset(1.0, 0.0),
                              end: Offset.zero,
                            ).chain(
                              CurveTween(curve: Curves.easeOutCubic),
                            );
                            return SlideTransition(
                              position: animation.drive(tween),
                              child: child,
                            );
                          },
                        ),
                      );
                    },
                  ),

                  const Spacer(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
