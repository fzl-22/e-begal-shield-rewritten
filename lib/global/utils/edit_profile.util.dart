import 'package:e_begal_shield_rewritten/modules/profile/edit_profile.page.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileUtil {
  static void edit(
    BuildContext context,
    String title,
    String initialValue,
    String instruction,
    VoidCallback onSubmitted,
    String? Function(String?) validator
  ) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EditProfilePage(
          title: title,
          initialValue: initialValue,
          instruction: instruction,
          onSubmitted: onSubmitted,
          validator: validator,
        ),
      ),
    );
  }

  static Future<void> setProfilePicture() async {
    final selectedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 100,
      maxHeight: 480,
      maxWidth: 480,
    );

    if (selectedImage != null) {
      return;
    }
  }
}
