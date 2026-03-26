import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart';

class ComingSoonPage extends StatelessWidget {
  const ComingSoonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF3E6),
      body: Stack(
        children: [
          const Center(
            child: Text(
              'Coming Soon',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: Color(0xFF683523),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: BottomNavBar(selectedIndex: 2, onTap: (_) {}),
          ),
        ],
      ),
    );
  }
}
