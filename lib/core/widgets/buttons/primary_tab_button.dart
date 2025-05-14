import 'package:flutter/material.dart';

class PrimaryTabButton extends StatelessWidget {
  const PrimaryTabButton({
    required this.title,
    this.selected = false,
    this.onTap,
    super.key,
  });

  final String title;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: selected ? 1 : 0.6,
      duration: const Duration(milliseconds: 300),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(6),
          child: Ink(
            padding: const EdgeInsets.all(12).add(
              const EdgeInsets.only(top: -4),
            ),
            child: Center(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
