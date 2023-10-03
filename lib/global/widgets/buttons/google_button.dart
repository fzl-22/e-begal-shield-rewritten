import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class GoogleButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget label;

  const GoogleButton({super.key, required this.onPressed, required this.label,});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 232, 232, 232),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        textStyle: Theme.of(context).textTheme.labelSmall,
        foregroundColor: Theme.of(context).colorScheme.tertiary,
        shadowColor: Colors.transparent,
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
      label: label,
      icon: Logo(Logos.google, size: 24),
    );
  }
}
