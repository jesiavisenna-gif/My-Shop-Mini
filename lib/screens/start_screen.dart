import 'package:flutter/material.dart';
import '../widgets/growtopia_background.dart';
import '../audio/bgm_controller.dart';
import '../controllers/auth_controller.dart';
import 'home_screen.dart';
import 'package:uts_pemrograman_mobile/screens/login_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GrowtopiaBackground(
        child: SafeArea(
          child: Stack(
            children: [
              /// ================================
              /// TOMBOL LOGIN (POJOK KIRI ATAS)
              /// ================================
              Positioned(
                top: 10,
                left: 10,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,   // hijau cerah
                    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => LoginScreen()),
                    );
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              /// =============================
              ///   TOMBOL LET'S START
              /// =============================
              Center(
                child: GestureDetector(
                  onTap: () async {
                    await BGMController.init();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => HomeScreen()),
                    );
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 120),
                    padding: EdgeInsets.symmetric(vertical: 18, horizontal: 40),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.95),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: Colors.black, width: 3),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          offset: Offset(0, 4),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    child: Text(
                      "Let's Start",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        shadows: [
                          Shadow(
                            blurRadius: 4,
                            color: Colors.grey.shade700,
                            offset: Offset(1, 1),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
