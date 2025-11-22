import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class GrowtopiaClouds extends StatefulWidget {
  final int cloudCount;
  final String assetPath;

  const GrowtopiaClouds({
    super.key,
    this.cloudCount = 6,
    required this.assetPath,
  });

  @override
  State<GrowtopiaClouds> createState() => _GrowtopiaCloudsState();
}

class _GrowtopiaCloudsState extends State<GrowtopiaClouds> {
  final Random random = Random();
  late List<_Cloud> clouds;

  Timer? timer;

  @override
  void initState() {
    super.initState();

    clouds = List.generate(widget.cloudCount, (_) => _randomCloud());

    timer = Timer.periodic(Duration(milliseconds: 16), (_) {
      _update();
    });
  }

  _Cloud _randomCloud() {
    return _Cloud(
      x: 300 + random.nextDouble() * 600,       // spawn kanan
      y: random.nextDouble() * 180,             // random height
      speed: 0.3 + random.nextDouble() * 0.9,   // speed random
      size: 70 + random.nextDouble() * 70,      // size random
    );
  }

  void _update() {
    final screenWidth = MediaQuery.of(context).size.width;

    setState(() {
      for (var cloud in clouds) {
        cloud.x -= cloud.speed; // move left

        if (cloud.x < -200) {
          // respawn di kanan layar
          cloud.x = screenWidth + random.nextDouble() * 200;
          cloud.y = random.nextDouble() * 180;
          cloud.speed = 0.3 + random.nextDouble() * 0.9;
          cloud.size = 70 + random.nextDouble() * 70;
        }
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: clouds.map((c) {
        return Positioned(
          left: c.x,
          top: c.y,
          child: Image.asset(
            widget.assetPath,
            width: c.size,
            filterQuality: FilterQuality.none,
          ),
        );
      }).toList(),
    );
  }
}

class _Cloud {
  double x;
  double y;
  double speed;
  double size;

  _Cloud({
    required this.x,
    required this.y,
    required this.speed,
    required this.size,
  });
}
