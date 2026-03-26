import 'package:flutter/material.dart';

class AddBookmarkModal extends StatefulWidget {
  const AddBookmarkModal({super.key});

  @override
  State<AddBookmarkModal> createState() => _AddBookmarkModalState();
}

class _AddBookmarkModalState extends State<AddBookmarkModal> {
  final TextEditingController _linkController = TextEditingController();

  @override
  void dispose() {
    _linkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Container(
        width: 293,
        decoration: BoxDecoration(
          color: const Color(0xFFFFFBFA),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icon
            Image.asset(
              'assets/images/brownAddIcon.png',
              width: 32,
              height: 32,
            ),

            const SizedBox(height: 8),

            // "New Bookmark" title
            const Text(
              'New Bookmark',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: Color(0xFF683523),
              ),
            ),

            const SizedBox(height: 4),

            // Subtitle
            const Text(
              'Paste the URL you\'d like to save!',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w300,
                fontSize: 12,
                color: Color(0xFFBFA090),
              ),
            ),

            const SizedBox(height: 12),

            // URL text field
            Container(
              width: 187,
              decoration: BoxDecoration(
                color: const Color(0xFFF5DDC3),
                borderRadius: BorderRadius.circular(6),
              ),
              child: TextField(
                controller: _linkController,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 11,
                  color: Color(0xFF683523),
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  hintText: 'Enter Link',
                  hintStyle: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 11,
                    color: Color(0xFFBFA090),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // Save button
            SizedBox(
              width: 187,
              child: GestureDetector(
                onTap: () {
                  // TODO: handle save
                  Navigator.of(context).pop();
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 9),
                  decoration: BoxDecoration(
                    color: const Color(0xFF84513E),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      'Save',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFFFF3E6),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 8),

            // Cancel button
            SizedBox(
              width: 187,
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 9),
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFF84513E)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF84513E),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
