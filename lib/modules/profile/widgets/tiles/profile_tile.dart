import 'package:flutter/material.dart';

class ProfileTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const ProfileTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        contentPadding: const EdgeInsets.only(left: 24),
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w500,
              ),
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          subtitle,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontWeight: FontWeight.normal,
              color: const Color.fromARGB(255, 103, 103, 103)),
        ),
      ),
    );
  }
}
