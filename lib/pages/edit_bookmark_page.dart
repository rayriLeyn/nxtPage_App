import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart';

class EditBookmarkPage extends StatefulWidget {
  final String siteName;
  final String bookName;
  final String description;
  final String coverImage;

  const EditBookmarkPage({
    super.key,
    required this.siteName,
    required this.bookName,
    required this.description,
    required this.coverImage,
  });

  @override
  State<EditBookmarkPage> createState() => _EditBookmarkPageState();
}

class _EditBookmarkPageState extends State<EditBookmarkPage> {
  int _selectedNavIndex = 0;
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.bookName);
    _descriptionController = TextEditingController(text: widget.description);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
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
                SizedBox(height: MediaQuery.of(context).padding.top + 16),

                // Back button
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

                // ── Section 1: Book cover ──────────────────────────
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    width: 353,
                    height: 366,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF3E6),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: const Color(0xFFF5DDC3),
                        width: 2,
                      ),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            widget.coverImage,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // ── Section 2: Edit section ────────────────────────
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Row 1: Title field + Delete + Save buttons
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Editable title box
                          Expanded(
                            child: Container(
                              height: 44,
                              decoration: const BoxDecoration(
                                color: Color(0xFFF5DDC3),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                              ),
                              child: TextField(
                                controller: _titleController,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Color(0xFF683523),
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  isDense: true,
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(width: 8),

                          // Delete button
                          _EditActionButton(
                            iconAsset: 'assets/images/deleteIcon.png',
                            label: 'Delete',
                            onTap: () {
                              // TODO: confirm delete
                            },
                          ),

                          const SizedBox(width: 6),

                          // Save button
                          _EditActionButton(
                            iconAsset: 'assets/images/saveIcon.png',
                            label: 'Save',
                            onTap: () {
                              // TODO: save changes
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      // Row 2: Editable description box
                      Container(
                        width: double.infinity,
                        constraints: const BoxConstraints(minHeight: 160),
                        decoration: const BoxDecoration(
                          color: Color(0xFFF5DDC3),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                        padding: const EdgeInsets.all(12),
                        child: TextField(
                          controller: _descriptionController,
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          style: const TextStyle(
                            color: Color(0xFF683523),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w300,
                            height: 1.6,
                          ),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                            hintText: 'Add a description...',
                            hintStyle: TextStyle(
                              color: Color(0xFFBFA090),
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 170),
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

// ── Small square action button ────────────────────────────────────────────────
class _EditActionButton extends StatefulWidget {
  final String iconAsset;
  final String label;
  final VoidCallback onTap;

  const _EditActionButton({
    required this.iconAsset,
    required this.label,
    required this.onTap,
  });

  @override
  State<_EditActionButton> createState() => _EditActionButtonState();
}

class _EditActionButtonState extends State<_EditActionButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) {
        setState(() => _pressed = false);
        widget.onTap();
      },
      onTapCancel: () => setState(() => _pressed = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: _pressed ? const Color(0xFF683523) : const Color(0xFFFFFBFA),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ColorFiltered(
              colorFilter: _pressed
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
              child: Image.asset(widget.iconAsset, width: 16, height: 16),
            ),
            const SizedBox(height: 2),
            Text(
              widget.label,
              style: TextStyle(
                color: _pressed
                    ? const Color(0xFFFFFBFA)
                    : const Color(0xFF683523),
                fontSize: 9,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
