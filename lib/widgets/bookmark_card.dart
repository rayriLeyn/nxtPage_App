import 'package:flutter/material.dart';
import '../pages/bookmarked_page.dart';

enum BookmarkCardTheme { pink, blue, yellow }

extension BookmarkCardThemeColors on BookmarkCardTheme {
  Color get cardColor {
    switch (this) {
      case BookmarkCardTheme.pink:
        return const Color(0xFFFFEBF4);
      case BookmarkCardTheme.blue:
        return const Color(0xFFDFF7FF);
      case BookmarkCardTheme.yellow:
        return const Color(0xFFFFF9D4);
    }
  }

  Color get textColor {
    switch (this) {
      case BookmarkCardTheme.pink:
        return const Color(0xFF7A2A4A);
      case BookmarkCardTheme.blue:
        return const Color(0xFF1A5F7A);
      case BookmarkCardTheme.yellow:
        return const Color(0xFF6B5A00);
    }
  }

  Color get subtleTextColor {
    switch (this) {
      case BookmarkCardTheme.pink:
        return const Color(0xFFB06080);
      case BookmarkCardTheme.blue:
        return const Color(0xFF4A8FA8);
      case BookmarkCardTheme.yellow:
        return const Color(0xFF9E8A30);
    }
  }
}

class BookmarkCard extends StatelessWidget {
  final String siteName;
  final String bookName;
  final String description;
  final String coverImage;
  final BookmarkCardTheme theme;
  final VoidCallback? onTap;

  const BookmarkCard({
    super.key,
    required this.siteName,
    required this.bookName,
    required this.description,
    this.coverImage = 'assets/images/book-cover-placeholder.png',
    this.theme = BookmarkCardTheme.pink,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          onTap ??
          () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BookmarkedPage(
                  siteName: siteName,
                  bookName: bookName,
                  description: description,
                  coverImage: coverImage,
                ),
              ),
            );
          },
      child: Container(
        width: 172,
        height: 279,
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(12),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Photo with inset rounded corners
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  width: double.infinity,
                  height: 184,
                  child: Image.asset(coverImage, fit: BoxFit.cover),
                ),
              ),
            ),
            // Text section
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      siteName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: theme.subtleTextColor,
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      bookName,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: theme.textColor,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Expanded(
                      child: Text(
                        description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: theme.subtleTextColor,
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
