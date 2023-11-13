import 'package:e_begal_shield_rewritten/global/utils/edit_profile.util.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class ProfileHeaderSection extends StatelessWidget {
  const ProfileHeaderSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Image.network(
            "https://i.pinimg.com/736x/32/3a/0a/323a0abe53856ef07526915033845947.jpg",
            width: double.infinity,
          ),
          Positioned(
            bottom: -32,
            right: 16,
            child: InkWell(
              borderRadius: BorderRadius.circular(32),
              onTap: EditProfileUtil.setProfilePicture,
              child: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.primary,
                radius: 32,
                child: Icon(
                  IconlyLight.camera,
                  size: 32,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 36,
            left: 24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Zenkey Soma Mahendra",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                ),
                Text(
                  "begal@shield.com",
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: const Color.fromARGB(255, 242, 242, 242),
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
