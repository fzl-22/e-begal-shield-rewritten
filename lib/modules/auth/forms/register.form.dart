import 'package:e_begal_shield_rewritten/global/utils/validator.util.dart';
import 'package:e_begal_shield_rewritten/global/widgets/buttons/google_button.dart';
import 'package:e_begal_shield_rewritten/global/widgets/buttons/submit_button.dart';
import 'package:e_begal_shield_rewritten/global/widgets/fields/highlighted_text_form_field.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _registerUser() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    _formKey.currentState!.save();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          HighlightedTextFormField(
            controller: _fullNameController,
            labelText: "Full Name",
            validator: ValidatorUtil.fullNameValidator,
            keyboardType: TextInputType.name,
          ),
          const SizedBox(height: 16),
          HighlightedTextFormField(
            controller: _emailController,
            labelText: "Email",
            validator: ValidatorUtil.registerEmailValidator,
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 16),
          HighlightedTextFormField(
            controller: _passwordController,
            labelText: "Password",
            validator: ValidatorUtil.registerPasswordValidator,
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  textStyle: Theme.of(context).textTheme.labelSmall,
                  foregroundColor: Theme.of(context).colorScheme.onBackground,
                  minimumSize: Size.zero,
                ),
                child: const Text("Forgot password?"),
              ),
            ],
          ),
          const SizedBox(height: 48),
          SubmitButton(
            onPressed: _registerUser,
            child: const Text("Register"),
          ),
          const SizedBox(height: 16),
          GoogleButton(
            onPressed: () {},
            label: const Text("Register with Google"),
          ),
        ],
      ),
    );
  }
}
