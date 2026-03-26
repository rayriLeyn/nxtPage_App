import 'package:flutter/material.dart';
import '../widgets/header_widget.dart';
import '../widgets/overview_card.dart';
import '../widgets/collection_card.dart';
import '../widgets/bottom_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF3E6),
      body: Stack(
        children: [
          // ── Scrollable body ──────────────────────────────────────────
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).padding.top + 16),

                // Header
                const HeaderWidget(),

                const SizedBox(height: 20),

                // Body content
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Overview card
                      const OverviewCard(),

                      const SizedBox(height: 28),

                      // Recent Collections
                      const Text(
                        'Recent Collections',
                        style: TextStyle(
                          color: Color(0xFF683523),
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 12),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: const [
                            CollectionCard(name: 'Novels'),
                            SizedBox(width: 12),
                            CollectionCard(name: 'Fanfics'),
                            SizedBox(width: 12),
                            CollectionCard(name: 'UI Design Inspo'),
                            SizedBox(width: 12),
                            SizedBox(width: 12),
                            CollectionCard(name: 'Writing Tips'),
                          ],
                        ),
                      ),

                      const SizedBox(height: 28),

                      // Unsorted Links
                      const Text(
                        'Unsorted Links',
                        style: TextStyle(
                          color: Color(0xFF683523),
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/UnsortedBookMarkVer1.png',
                              width: 100,
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              "Wow, you're so organized!",
                              style: TextStyle(
                                color: Color(0xFF683523),
                                fontSize: 20,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 8),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 24),
                              child: Text(
                                "Links that's not added in any collection or newly added links will be here. Tap the + icon below to add one!",
                                style: TextStyle(
                                  color: Color(0xFF683523),
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Spacer so content clears nav bar
                      const SizedBox(height: 100),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // ── Fixed bottom nav ─────────────────────────────────────────
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: BottomNavBar(
              selectedIndex: _selectedNavIndex,
              onTap: (i) => setState(() => _selectedNavIndex = i),
            ),
          ),
        ],
      ),
    );
  }
}
