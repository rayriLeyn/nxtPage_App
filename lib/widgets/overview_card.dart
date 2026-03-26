import 'package:flutter/material.dart';
import 'package:nxtpage_proj1/pages/collections_page.dart';

class OverviewCard extends StatelessWidget {
  const OverviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 353,
      height: 174,
      decoration: BoxDecoration(
        color: const Color(0xFF44D3FF),
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          // Decorative corner image
          Positioned(
            right: -10,
            bottom: -10,
            child: Image.asset(
              'assets/images/faceCard.png',
              width: 130,
              fit: BoxFit.contain,
            ),
          ),
          // Text + button
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 250,
                  child: Text(
                    'Ready to actually check out your web links instead of letting them rot in your browser favorites?',
                    style: const TextStyle(
                      color: Color(0xFF003646),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                _CollectionsButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CollectionsButton extends StatefulWidget {
  @override
  State<_CollectionsButton> createState() => _CollectionsButtonState();
}

class _CollectionsButtonState extends State<_CollectionsButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const CollectionsPage()),
      ),
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        decoration: BoxDecoration(
          color: _isPressed ? const Color(0xFF002535) : const Color(0xFF003646),
          borderRadius: BorderRadius.circular(30),
        ),
        child: const Text(
          'Collections',
          style: TextStyle(
            color: Color(0xFFD4F5FF),
            fontSize: 14,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
