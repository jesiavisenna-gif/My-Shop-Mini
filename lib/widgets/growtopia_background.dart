import 'package:flutter/material.dart';
import 'growtopia_clouds.dart';

class GrowtopiaBackground extends StatelessWidget {
  final Widget child;

  const GrowtopiaBackground({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    return SizedBox(
      width: screen.width,
      height: screen.height,
      child: Stack(
        children: [
          /// ================================
          /// SKY LAYER (full width, full 70%)
          /// ================================
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: screen.height * 0.70,
            child: Image.asset(
              "assets/sky.png",
              fit: BoxFit.cover,
              filterQuality: FilterQuality.none,
            ),
          ),

          /// ================================
          /// CLOUD LAYER (di atas sky)
          /// ================================
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: screen.height * 0.70,
            child: IgnorePointer(
              child: GrowtopiaClouds(
                cloudCount: 6,
                assetPath: "assets/clouds.png",
              ),
            ),
          ),

          /// ================================
          /// GROUND (30%)
          /// ================================
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: screen.height * 0.30,
            child: Image.asset(
              "assets/ground.png",
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
              filterQuality: FilterQuality.none,
            ),
          ),

          /// ================================
          /// FOREGROUND CONTENT
          /// ================================
          Positioned.fill(
            child: child,
          ),
        ],
      ),
    );
  }
}
