import 'package:flutter/material.dart';

class PrimaryFilledButton extends StatelessWidget {
  const PrimaryFilledButton({
    required this.title,
    this.onPressed,
    super.key,
  });

  final String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: FilledButton(
        onPressed: onPressed,
        child: Text(title),
      ),
    );
  }
}
