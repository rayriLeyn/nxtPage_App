import 'package:flutter/material.dart';
import '../widgets/options_panel.dart';
import '../widgets/bottom_nav_bar.dart';
import '../pages/bookmarked_page.dart';
import 'edit_bookmark_page.dart';

class BookmarkedPage extends StatefulWidget {
  final String siteName;
  final String bookName;
  final String description;
  final String coverImage; // add this

  const BookmarkedPage({
    super.key,
    required this.siteName,
    required this.bookName,
    required this.description,
    this.coverImage = 'assets/images/book-cover-placeholder.png',
  });

  @override
  State<BookmarkedPage> createState() => _BookmarkedPageState();
}

class _BookmarkedPageState extends State<BookmarkedPage> {
  bool _expanded = false;
  int _selectedNavIndex = 0;

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
                SizedBox(height: MediaQuery.of(context).padding.top + 16),

                // ── Back button ──────────────────────────────────
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Color(0xFF683523),
                      size: 20,
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // ── Section 1: Collapsible bookmark card ─────────
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),

                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5DDC3),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Cover image
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: SizedBox(
                              width: double.infinity,
                              height: 300,
                              child: Image.asset(
                                'assets/images/book-cover-placeholder.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),

                        // Text section
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Site name
                              Text(
                                widget.siteName,
                                style: const TextStyle(
                                  color: Color(0xFFB06080),
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 4),
                              // Book name
                              Text(
                                widget.bookName,
                                style: const TextStyle(
                                  color: Color(0xFF683523),
                                  fontSize: 20,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 8),
                              // Collapsible description
                              AnimatedCrossFade(
                                duration: const Duration(milliseconds: 250),
                                crossFadeState: _expanded
                                    ? CrossFadeState.showSecond
                                    : CrossFadeState.showFirst,
                                // Collapsed: 3 lines
                                firstChild: Text(
                                  widget.description,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Color(0xFF9E6B50),
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                // Expanded: full text
                                secondChild: Text(
                                  widget.description,
                                  style: const TextStyle(
                                    color: Color(0xFF9E6B50),
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 6),
                              // Expand/collapse hint
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AnimatedRotation(
                                    duration: const Duration(milliseconds: 250),
                                    turns: _expanded ? 0.5 : 0,
                                    child: const Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: Color(0xFF9E6B50),
                                      size: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // ── Section 2: Options panel ─────────────────────
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: OptionsPanel(
                    onManageTags: () {
                      // TODO: open manage tags
                    },
                    onEdit: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditBookmarkPage(
                            siteName: widget.siteName,
                            bookName: widget.bookName,
                            description: widget.description,
                            coverImage: widget.coverImage,
                          ),
                        ),
                      );
                    },
                    onDelete: () {
                      // TODO: open delete confirmation
                    },
                    onOpenLink: () {
                      // TODO: open webview
                    },
                  ),
                ),

                const SizedBox(height: 150),
              ],
            ),
          ),

          // ── Fixed bottom nav ───────────────────────────────────
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
