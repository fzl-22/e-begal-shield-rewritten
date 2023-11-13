import 'package:e_begal_shield_rewritten/global/widgets/buttons/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class EditProfilePage extends StatefulWidget {
  final String title;
  final String initialValue;
  final String instruction;
  final VoidCallback onSubmitted;
  final String? Function(String?)? validator;

  const EditProfilePage({
    super.key,
    required this.title,
    required this.initialValue,
    required this.instruction,
    required this.onSubmitted,
    required this.validator,
  });

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController(text: widget.initialValue);
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
          icon: const Icon(IconlyLight.arrow_left_2),
        ),
        title: Text(
          widget.title,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Colors.black87,
              ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 12,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Set ${widget.title.toLowerCase()}",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            TextFormField(
              controller: _controller,
              validator: widget.validator,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.tertiary,
                    width: 2,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.secondary,
                    width: 2,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              widget.instruction,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.normal,
                  ),
            ),
            const SizedBox(height: 48),
            SubmitButton(
                onPressed: widget.onSubmitted, child: const Text("Submit"))
          ],
        ),
      ),
    );
  }
}
