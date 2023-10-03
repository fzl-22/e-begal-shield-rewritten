import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;

  const SubmitButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: Theme.of(context).textTheme.labelMedium,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(vertical: 16)),
      child: child,
    );
  }
}
