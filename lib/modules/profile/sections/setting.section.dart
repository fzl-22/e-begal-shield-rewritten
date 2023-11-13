import 'package:e_begal_shield_rewritten/modules/profile/widgets/dividers/setting_divider.dart';
import 'package:e_begal_shield_rewritten/modules/profile/widgets/tiles/setting_tile.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class SettingsSection extends StatelessWidget {
  const SettingsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Text(
              "Settings and Help",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          SettingTile(
            title: "Security",
            icon: IconlyLight.lock,
            onTap: () {},
          ),
          const SettingDivider(),
          SettingTile(
            title: "FAQ",
            icon: Icons.question_mark_sharp,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
