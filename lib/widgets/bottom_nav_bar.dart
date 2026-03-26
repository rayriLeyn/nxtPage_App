import 'package:flutter/material.dart';
import 'package:nxtpage_proj1/pages/home.dart';
import 'add_bookmark_modal.dart';
import 'package:nxtpage_proj1/pages/coming_soon_page.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTap;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  static const _items = [
    _NavItem(label: 'Home', asset: 'assets/images/homeIcon.png'),
    _NavItem(label: 'Add', asset: 'assets/images/addIcon.png'),
    _NavItem(label: 'Profile', asset: 'assets/images/profileIcon.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF683523),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF84513E).withOpacity(0.08),
            offset: const Offset(0, -5),
            blurRadius: 10,
          ),
        ],
      ),
      padding: EdgeInsets.only(
        top: 12,
        bottom: MediaQuery.of(context).padding.bottom + 12,
        left: 20,
        right: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(_items.length, (i) {
          final selected = selectedIndex == i;
          return GestureDetector(
            onTap: () {
              onTap(i);
              if (i == 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const HomePage()),
                );
              } else if (i == 1) {
                showDialog(
                  context: context,
                  barrierColor: const Color(0xFF724535).withOpacity(0.70),
                  builder: (_) => const AddBookmarkModal(),
                );
              } else if (i == 2) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ComingSoonPage()),
                );
              }
            },
            behavior: HitTestBehavior.opaque,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 180),
                  width: selected ? 54 : 32,
                  height: 23,
                  decoration: BoxDecoration(
                    color: selected
                        ? const Color(0xFFF5DDC3)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(30),
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
                          : const ColorFilter.mode(
                              Colors.transparent,
                              BlendMode.dst,
                            ),
                      child: Image.asset(
                        _items[i].asset,
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  _items[i].label,
                  style: const TextStyle(
                    color: Color(0xFFF5DDC3),
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class _NavItem {
  final String label;
  final String asset;
  const _NavItem({required this.label, required this.asset});
}
