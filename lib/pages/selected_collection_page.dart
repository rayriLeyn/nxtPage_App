import 'package:flutter/material.dart';
import '../widgets/bookmark_card.dart';
import '../widgets/bottom_nav_bar.dart';
import '../data/bookmarks_data.dart';

class SelectedCollectionPage extends StatefulWidget {
  final String collectionName;

  const SelectedCollectionPage({super.key, required this.collectionName});

  @override
  State<SelectedCollectionPage> createState() => _SelectedCollectionPageState();
}

class _SelectedCollectionPageState extends State<SelectedCollectionPage> {
  int _selectedNavIndex = 0;

  BookmarkCardTheme _themeForIndex(int i) {
    const themes = BookmarkCardTheme.values;
    return themes[i % themes.length];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF3E6),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).padding.top + 24),

                // Back + Title
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: Color(0xFF683523),
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        widget.collectionName,
                        style: const TextStyle(
                          color: Color(0xFF683523),
                          fontSize: 24,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // 2-column grid from data
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
                          childAspectRatio: 172 / 279,
                        ),
                    itemCount: novelsBookmarks.length,
                    itemBuilder: (context, i) {
                      final b = novelsBookmarks[i];
                      return BookmarkCard(
                        siteName: b.siteName,
                        bookName: b.bookName,
                        description: b.description,
                        theme: _themeForIndex(i),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 100),
              ],
            ),
          ),

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
