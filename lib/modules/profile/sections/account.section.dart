import 'package:e_begal_shield_rewritten/global/utils/edit_profile.util.dart';
import 'package:e_begal_shield_rewritten/global/utils/validator.util.dart';
import 'package:e_begal_shield_rewritten/modules/profile/widgets/dividers/profile_data_divider.dart';
import 'package:e_begal_shield_rewritten/modules/profile/widgets/tiles/profile_tile.dart';
import 'package:flutter/material.dart';

class AccountSection extends StatelessWidget {
  const AccountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Text(
              "Account",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          ProfileTile(
            title: "Zenkey Soma Mahendra",
            subtitle: "Full Name",
            onTap: () {
              EditProfileUtil.edit(
                context,
                "Full Name",
                "Zenkey Soma Mahendra",
                "Please set your full name no more than 64 characters.",
                () {},
                ValidatorUtil.fullNameValidator,
              );
            },
          ),
          const ProfileDataDivider(),
          ProfileTile(
            title: "begal@shield.com",
            subtitle: "Tap to change email address",
            onTap: () {},
          ),
          const ProfileDataDivider(),
          ProfileTile(
            title: "Supra Bapak",
            subtitle: "Device Name",
            onTap: () {},
          ),
          const ProfileDataDivider(),
          ProfileTile(
            title: "L 1234 AB",
            subtitle: "Device ID",
            onTap: () {},
          ),
          const ProfileDataDivider(),
          ProfileTile(
            title: "Ketintang",
            subtitle: "Address",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
