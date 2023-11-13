import 'package:flutter/material.dart';

class SettingDivider extends StatelessWidget {
  const SettingDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      color: Theme.of(context).colorScheme.tertiary.withOpacity(0.5),
      indent: 64,
    );
  }
}