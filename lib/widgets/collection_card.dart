import 'package:flutter/material.dart';

class CollectionCard extends StatelessWidget {
  final String name;
  final double width;
  final double height;
  final double fontSize;
  final VoidCallback? onTap;

  const CollectionCard({
    super.key,
    required this.name,
    this.width = 176,
    this.height = 115,
    this.fontSize = 18,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFFF5DDC3),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                color: const Color(0xFF683523),
                fontSize: fontSize,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
            const Spacer(),
            Container(
              width: 52,
              height: 36,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                image: const DecorationImage(
                  image: AssetImage('assets/images/PhotoPreview.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
