import 'package:flutter/material.dart';
import '../widgets/collection_card.dart';
import '../widgets/bottom_nav_bar.dart';
import 'selected_collection_page.dart';

class CollectionsPage extends StatefulWidget {
  const CollectionsPage({super.key});

  @override
  State<CollectionsPage> createState() => _CollectionsPageState();
}

class _CollectionsPageState extends State<CollectionsPage> {
  int _selectedNavIndex = 0;

  // Replace this with your real data source later
  final List<String> _collections = [
    'Novels',
    'Fanfics',
    'Cooking Vids',
    'UI Design',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF3E6),
      body: Stack(
        children: [
          // ── Scrollable body ────────────────────────────────────────
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).padding.top + 32),

                // Title
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Collections',
                    style: TextStyle(
                      color: Color(0xFF683523),
                      fontSize: 24,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                // 2-column card grid
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 171 / 89,
                        ),
                    itemCount: _collections.length,
                    itemBuilder: (context, i) {
                      return CollectionCard(
                        name: _collections[i],
                        width: 171,
                        height: 89,
                        fontSize: 12,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SelectedCollectionPage(
                                collectionName: _collections[i],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),

                const SizedBox(height: 510),
              ],
            ),
          ),

          // ── Fixed bottom nav ───────────────────────────────────────
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
