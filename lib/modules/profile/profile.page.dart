import 'package:e_begal_shield_rewritten/global/utils/edit_profile.util.dart';
import 'package:e_begal_shield_rewritten/global/utils/validator.util.dart';
import 'package:e_begal_shield_rewritten/modules/profile/sections/account.section.dart';
import 'package:e_begal_shield_rewritten/modules/profile/sections/profile_header.section.dart';
import 'package:e_begal_shield_rewritten/modules/profile/sections/setting.section.dart';
import 'package:e_begal_shield_rewritten/modules/profile/widgets/buttons/profile_popup_menu_button.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Future<void> _logoutUser(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            "Confirm Logout",
          ),
          titleTextStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: const Color.fromARGB(255, 80, 80, 80),
              ),
          content: const Text("Are you sure you want to log out?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.primary,
                textStyle: Theme.of(context).textTheme.labelMedium,
              ),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.onSecondary,
                textStyle: Theme.of(context).textTheme.labelMedium,
              ),
              child: const Text(
                'Logout',
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
        elevation: 0,
        actions: [
          ProfilePopupMenuButton(
            editFullName: (context) {
              EditProfileUtil.edit(
                context,
                "Full Name",
                "Zenkey Soma Mahendra",
                "Please set your full name no more than 64 characters.",
                () {},
                ValidatorUtil.fullNameValidator,
              );
            },
            setProfilePicture: EditProfileUtil.setProfilePicture,
            logoutUser: _logoutUser,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ProfileHeaderSection(),
            const AccountSection(),
            Container(
              height: 12,
              color: Theme.of(context).colorScheme.tertiary.withOpacity(0.5),
            ),
            const SettingsSection(),
          ],
        ),
      ),
    );
  }
}
