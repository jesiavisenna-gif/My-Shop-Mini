import 'package:flutter/material.dart';
import '../models/product.dart';

class GrowtopiaVendingSlot extends StatefulWidget {
  final Product product;
  final VoidCallback onTap;

  const GrowtopiaVendingSlot({
    super.key,
    required this.product,
    required this.onTap,
  });

  @override
  State<GrowtopiaVendingSlot> createState() => _GrowtopiaVendingSlotState();
}

class _GrowtopiaVendingSlotState extends State<GrowtopiaVendingSlot> {
  bool hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hovering = true),
      onExit: (_) => setState(() => hovering = false),

      child: GestureDetector(
        onTap: widget.onTap,

        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 22),

          /// 💠 MEDIUM SIZE SLOT
          width: 160,
          height: 175,

          child: Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [

              // ==========================================
              // BACKGROUND BLOCK (pixelated)
              // ==========================================
              Image.asset(
                "assets/display_block.png",
                width: 160,
                height: 175,
                fit: BoxFit.contain,
                filterQuality: FilterQuality.none,
              ),

              // ==========================================
              // IKON PRODUK
              // ==========================================
              Icon(
                widget.product.icon,
                size: 52,
                color: Colors.white,
              ),

              // ==========================================
              // FLOATING LABEL (FADE IN/OUT)
              // ==========================================
              Positioned(
                top: -12,
                child: AnimatedOpacity(
                  opacity: hovering ? 1 : 0,
                  duration: Duration(milliseconds: 180), // Fade cepat GT style

                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.75),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      widget.product.name,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
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
