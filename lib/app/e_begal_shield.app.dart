import 'package:e_begal_shield_rewritten/global/config/router.config.dart';
import 'package:e_begal_shield_rewritten/global/themes/color.theme.dart';
import 'package:e_begal_shield_rewritten/global/themes/text.theme.dart';
import 'package:flutter/material.dart';

class EBegalShieldApp extends StatelessWidget {
  const EBegalShieldApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: colorScheme,
          useMaterial3: true,
          fontFamily: 'Poppins',
          textTheme: textTheme,
        ),
        routerConfig: routerConfig,
      ),
    );
  }
}
