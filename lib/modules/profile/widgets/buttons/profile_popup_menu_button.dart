import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class ProfilePopupMenuButton extends StatefulWidget {
  final void Function(BuildContext) editFullName;
  final Future<void> Function() setProfilePicture;
  final Future<void> Function(BuildContext) logoutUser;

  const ProfilePopupMenuButton({
    super.key,
    required this.editFullName,
    required this.setProfilePicture,
    required this.logoutUser,
  });

  @override
  State<ProfilePopupMenuButton> createState() => _ProfilePopupMenuButtonState();
}

class _ProfilePopupMenuButtonState extends State<ProfilePopupMenuButton> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      color: Colors.white,
      padding: const EdgeInsets.all(0),
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            value: 0,
            child: ListTile(
              contentPadding: const EdgeInsets.all(0),
              leading: const Icon(
                IconlyLight.edit,
              ),
              title: Text(
                "Edit Full Name",
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
          ),
          PopupMenuItem(
            value: 1,
            child: ListTile(
              contentPadding: const EdgeInsets.all(0),
              leading: const Icon(
                IconlyLight.camera,
              ),
              title: Text(
                "Set Profile Photo",
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
          ),
          PopupMenuItem(
            value: 2,
            child: ListTile(
              contentPadding: const EdgeInsets.all(0),
              leading: const Icon(
                IconlyLight.logout,
              ),
              title: Text(
                "Log Out",
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
          ),
        ];
      },
      onSelected: (value) async {
        if (value == 0) {
          widget.editFullName(context);
        } else if (value == 1) {
          await widget.setProfilePicture();
        } else if (value == 2) {
          await widget.logoutUser(context);
        }
      },
    );
  }
}
