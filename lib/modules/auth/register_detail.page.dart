import 'dart:io';

import 'package:e_begal_shield_rewritten/global/utils/validator.util.dart';
import 'package:e_begal_shield_rewritten/global/widgets/buttons/submit_button.dart';
import 'package:e_begal_shield_rewritten/global/widgets/fields/highlighted_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';

class RegisterDetailPage extends StatefulWidget {
  final String fullName;
  final String emailAddress;
  final String password;

  const RegisterDetailPage({
    super.key,
    required this.fullName,
    required this.emailAddress,
    required this.password,
  });

  @override
  State<RegisterDetailPage> createState() => _RegisterDetailPageState();
}

class _RegisterDetailPageState extends State<RegisterDetailPage> {
  final _formKey = GlobalKey<FormState>();
  File? _profilePicture;
  final _fullNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _dateOfBirthController = TextEditingController();
  final _deviceNameController = TextEditingController();
  final _deviceIdController = TextEditingController();

  Future<void> _selectDateOfBirth() async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(
        const Duration(days: 365 * 100),
      ),
      lastDate: DateTime.now(),
      confirmText: "OK",
      cancelText: "Cancel",
    );

    if (selectedDate == null) {
      return;
    }

    setState(() {
      _dateOfBirthController.text =
          selectedDate.toLocal().toString().split(" ")[0];
    });
  }

  Future<void> _selectProfilePicture() async {
    final selectedImage = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 100,
      maxHeight: 480,
      maxWidth: 480,
    );

    if (selectedImage == null) {
      return;
    }
    setState(() {
      _profilePicture = File(selectedImage.path);
    });
  }

  @override
  void initState() {
    _fullNameController.text = widget.fullName;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Center(
                child: InkWell(
                  borderRadius: BorderRadius.circular(64),
                  onTap: _selectProfilePicture,
                  child: _profilePicture == null
                      ? ProfilePicture(
                          name: _fullNameController.text.contains(" ")
                              ? _fullNameController.text.trim()
                              : _fullNameController.text,
                          radius: 64,
                          fontsize: 36,
                          count: 2,
                        )
                      : CircleAvatar(
                          radius: 64,
                          backgroundImage: FileImage(_profilePicture!)),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    HighlightedTextFormField(
                      controller: _fullNameController,
                      labelText: "Full Name",
                      validator: ValidatorUtil.fullNameValidator,
                      onChanged: (value) {
                        setState(() {
                          _fullNameController.text = value;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    HighlightedTextFormField(
                      controller: _phoneNumberController,
                      labelText: "Phone Number",
                      validator: ValidatorUtil.phoneNumberValidator,
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.background,
                          shadowColor: Colors.transparent,
                          foregroundColor:
                              Theme.of(context).colorScheme.onBackground,
                          textStyle:
                              Theme.of(context).textTheme.labelSmall!.copyWith(
                                    fontWeight: FontWeight.normal,
                                  ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: BorderSide(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 18),
                          alignment: Alignment.centerLeft),
                      onPressed: _selectDateOfBirth,
                      icon: const Icon(IconlyLight.calendar),
                      label: Text(_dateOfBirthController.text.isNotEmpty
                          ? _dateOfBirthController.text
                          : "Select Date of Birth"),
                    ),
                    const SizedBox(height: 16),
                    HighlightedTextFormField(
                      controller: _deviceNameController,
                      labelText: "Device Name",
                      validator: ValidatorUtil.deviceNameValidator,
                      keyboardType: TextInputType.name,
                    ),
                    const SizedBox(height: 16),
                    HighlightedTextFormField(
                      controller: _deviceIdController,
                      labelText: "Device ID",
                      validator: ValidatorUtil.deviceIdValidator,
                      keyboardType: TextInputType.name,
                    ),
                    const SizedBox(height: 36),
                    SubmitButton(
                      onPressed: () {},
                      child: const Text("Create User"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
