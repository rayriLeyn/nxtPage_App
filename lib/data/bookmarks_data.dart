class Bookmark {
  final String siteName;
  final String bookName;
  final String description;
  final String coverImage;

  const Bookmark({
    required this.siteName,
    required this.bookName,
    required this.description,
    required this.coverImage,
  });
}

// Sample data — replace or extend with real data later
const List<Bookmark> novelsBookmarks = [
  Bookmark(
    siteName: 'NovelUpdates',
    bookName: "Omniscient Reader's Viewpoint",
    coverImage: 'assets/images/book-cover-placeholder.png',
    description:
        "Kim Dok-Ja does not consider himself the protagonist of his own life. "
        "Befitting the name his parents gave him, he is a solitary person whose "
        "sole hobby is reading web novels. For over a decade, he has lived "
        "vicariously through Yu Jung-Hyeok, the main character of the web novel "
        "Three Ways to Survive the Apocalypse (TWSA).\n\n"
        "Through Jung-Hyeok, Dok-Ja has experienced secondhand the trials of "
        "repeatedly regressing in time, in search of an end to life-threatening "
        "\"scenarios\" that force people to act out narratives for the amusement "
        "of god-like \"Constellations.\"\n\n"
        "After reading 3,149 chapters—long after all other readers lost "
        "interest—Dok-Ja finally resigns himself to the story ending. However, "
        "he receives an enigmatic message from the author, stating that the story "
        "will soon be monetized, before his surroundings suddenly go dark.\n\n"
        "He swiftly realizes that fiction has become reality and he is now living "
        "through TWSA. Although he is the singular omniscient reader of the events "
        "yet to come, his success in the scenarios is not guaranteed—but perhaps "
        "his advantage will empower him to step into the protagonist role that "
        "never suited him before.",
  ),
  Bookmark(
    siteName: 'NovelUpdates',
    bookName: "Omniscient Reader's Viewpoint",
    coverImage: 'assets/images/book-cover-placeholder.png',
    description:
        "Kim Dok-Ja does not consider himself the protagonist of his own life. "
        "Befitting the name his parents gave him, he is a solitary person...",
  ),
  Bookmark(
    siteName: 'NovelUpdates',
    bookName: "Omniscient Reader's Viewpoint",
    coverImage: 'assets/images/book-cover-placeholder.png',
    description:
        "Kim Dok-Ja does not consider himself the protagonist of his own life. "
        "Befitting the name his parents gave him, he is a solitary person...",
  ),
  Bookmark(
    siteName: 'NovelUpdates',
    bookName: "Omniscient Reader's Viewpoint",
    coverImage: 'assets/images/book-cover-placeholder.png',
    description:
        "Kim Dok-Ja does not consider himself the protagonist of his own life. "
        "Befitting the name his parents gave him, he is a solitary person...",
  ),
];
