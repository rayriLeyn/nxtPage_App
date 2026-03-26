import 'package:flutter/material.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  int? _selectedIcon; // 0 = notif, 1 = search

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Profile picture
          CircleAvatar(
            radius: 28,
            backgroundColor: const Color(0xFFF5DDC3),
            backgroundImage: const AssetImage('assets/images/profilePic.png'),
          ),
          const SizedBox(width: 12),
          // Welcome text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Welcome Back',
                  style: TextStyle(
                    color: Color(0xFF683523),
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  'User Name!',
                  style: TextStyle(
                    color: Color(0xFF683523),
                    fontSize: 24,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          // Icon menu
          _HeaderIconBar(
            selectedIndex: _selectedIcon,
            onSelected: (i) {
              setState(() {
                _selectedIcon = (_selectedIcon == i) ? null : i;
              });
            },
          ),
        ],
      ),
    );
  }
}

class _HeaderIconBar extends StatelessWidget {
  final int? selectedIndex;
  final ValueChanged<int> onSelected;

  const _HeaderIconBar({required this.selectedIndex, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFF5DDC3),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          _IconButton(
            assetName: 'assets/images/notifIcon.png',
            selected: selectedIndex == 0,
            onTap: () => onSelected(0),
          ),
          const SizedBox(width: 4),
          _IconButton(
            assetName: 'assets/images/searchIcon.png',
            selected: selectedIndex == 1,
            onTap: () => onSelected(1),
          ),
        ],
      ),
    );
  }
}

class _IconButton extends StatelessWidget {
  final String assetName;
  final bool selected;
  final VoidCallback onTap;

  const _IconButton({
    required this.assetName,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: selected ? const Color(0xFF683523) : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: ColorFiltered(
            colorFilter: selected
                ? const ColorFilter.matrix([
                    -1,
                    0,
                    0,
                    0,
                    255,
                    0,
                    -1,
                    0,
                    0,
                    255,
                    0,
                    0,
                    -1,
                    0,
                    255,
                    0,
                    0,
                    0,
                    1,
                    0,
                  ])
                : const ColorFilter.mode(Colors.transparent, BlendMode.dst),
            child: Image.asset(assetName, width: 20, height: 20),
          ),
        ),
      ),
    );
  }
}
