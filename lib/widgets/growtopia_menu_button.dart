import 'package:flutter/material.dart';

class GrowtopiaMenuButton extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const GrowtopiaMenuButton({
    required this.icon,
    required this.label,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  _GrowtopiaMenuButtonState createState() => _GrowtopiaMenuButtonState();
}

class _GrowtopiaMenuButtonState extends State<GrowtopiaMenuButton> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => pressed = true),
      onTapUp: (_) => setState(() => pressed = false),
      onTapCancel: () => setState(() => pressed = false),
      onTap: widget.onTap,

      child: AnimatedContainer(
        duration: Duration(milliseconds: 90),

        // tombol lebih kecil, lebih mobile-friendly
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 60),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),

        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.95),
          border: Border.all(color: Colors.black, width: 3),
          borderRadius: BorderRadius.circular(10),

          // bayangan kecil ala Growtopia
          boxShadow: pressed
              ? []
              : [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    offset: const Offset(0, 3),
                    blurRadius: 3,
                  )
                ],
        ),

        // efek turun saat ditekan
        transform: pressed
            ? Matrix4.translationValues(0, 2, 0)
            : Matrix4.translationValues(0, 0, 0),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // rata tengah
          mainAxisSize: MainAxisSize.max,

          children: [
            Icon(widget.icon, size: 22, color: Colors.black), // ikon diperkecil
            const SizedBox(width: 10),
            Text(
              widget.label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,          // teks diperkecil sedikit
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
