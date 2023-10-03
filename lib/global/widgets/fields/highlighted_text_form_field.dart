import 'package:flutter/material.dart';

class HighlightedTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final bool obscureText;

  const HighlightedTextFormField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.validator,
    this.keyboardType = TextInputType.name,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
          ),
        ),
        labelText: labelText,
        labelStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
              color: Theme.of(context).colorScheme.secondary,
            ),
        alignLabelWithHint: true,
        floatingLabelStyle: const TextStyle(),
        floatingLabelAlignment: FloatingLabelAlignment.start,
      ),
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
    );
  }
}
