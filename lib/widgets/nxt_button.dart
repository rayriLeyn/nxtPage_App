import 'package:flutter/material.dart';

class NxtButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;

  const NxtButton({super.key, required this.label, required this.onTap});

  @override
  State<NxtButton> createState() => _NxtButtonState();
}

class _NxtButtonState extends State<NxtButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) {
        setState(() => _isPressed = false);
        widget.onTap();
      },
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 71, vertical: 10),
        decoration: ShapeDecoration(
          color: _isPressed ? const Color(0xFF6B3E2E) : const Color(0xFF84513E),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          widget.label,
          style: const TextStyle(
            color: Color(0xFFFFF3E6),
            fontSize: 14,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
