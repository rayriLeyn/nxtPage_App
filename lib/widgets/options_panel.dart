import 'package:flutter/material.dart';

class OptionsPanel extends StatelessWidget {
  final VoidCallback? onManageTags;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final VoidCallback? onOpenLink;

  const OptionsPanel({
    super.key,
    this.onManageTags,
    this.onEdit,
    this.onDelete,
    this.onOpenLink,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 353,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFF5DDC3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          // ── Row 1: Manage Tags | Edit | Delete ─────────────────
          Row(
            children: [
              // Manage Tags — rounded left only
              _OptionButton(
                width: 191,
                height: 50,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                onTap: onManageTags,
                child: Row(
                  children: const [
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '# Manage Tags',
                            style: TextStyle(
                              fontSize: 13,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'Add Tags for easy search keywords',
                            style: TextStyle(
                              fontSize: 10,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w300,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 4),

              // Edit — no rounded corners
              _OptionButton(
                width: 66,
                height: 50,
                borderRadius: BorderRadius.zero,
                onTap: onEdit,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/editIcon.png',
                      width: 20,
                      height: 20,
                    ),
                    const SizedBox(height: 2),
                    const Text(
                      'Edit',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 4),

              // Delete — rounded right only
              _OptionButton(
                width: 66,
                height: 50,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                onTap: onDelete,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/deleteIcon.png',
                      width: 20,
                      height: 20,
                    ),
                    const SizedBox(height: 2),
                    const Text(
                      'Delete',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 6),

          // ── Row 2: Open Link ───────────────────────────────────
          _OptionButton(
            width: double.infinity,
            height: 50,
            borderRadius: BorderRadius.circular(10),
            onTap: onOpenLink,
            child: Row(
              children: const [
                SizedBox(width: 12),
                ImageIcon(AssetImage('assets/images/linkIcon.png'), size: 20),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Open Link',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Open WebView',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Reusable pressable button with color invert on press ─────────────────────
class _OptionButton extends StatefulWidget {
  final double width;
  final double height;
  final BorderRadius borderRadius;
  final VoidCallback? onTap;
  final Widget child;

  const _OptionButton({
    required this.width,
    required this.height,
    required this.borderRadius,
    required this.child,
    this.onTap,
  });

  @override
  State<_OptionButton> createState() => _OptionButtonState();
}

class _OptionButtonState extends State<_OptionButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) {
        setState(() => _pressed = false);
        widget.onTap?.call();
      },
      onTapCancel: () => setState(() => _pressed = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: _pressed ? const Color(0xFF683523) : const Color(0xFFFFFBFA),
          borderRadius: widget.borderRadius,
        ),
        child: DefaultTextStyle.merge(
          style: TextStyle(
            color: _pressed ? const Color(0xFFFFFBFA) : const Color(0xFF683523),
          ),
          child: IconTheme(
            data: IconThemeData(
              color: _pressed
                  ? const Color(0xFFFFFBFA)
                  : const Color(0xFF683523),
            ),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
