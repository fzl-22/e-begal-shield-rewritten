import 'package:e_begal_shield_rewritten/global/utils/validator.util.dart';
import 'package:e_begal_shield_rewritten/global/widgets/buttons/google_button.dart';
import 'package:e_begal_shield_rewritten/global/widgets/buttons/submit_button.dart';
import 'package:e_begal_shield_rewritten/global/widgets/fields/highlighted_text_form_field.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _loginUser() async {
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
            controller: _emailController,
            labelText: "Email",
            validator: ValidatorUtil.loginEmailValidator,
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 16),
          HighlightedTextFormField(
            controller: _passwordController,
            labelText: "Password",
            validator: ValidatorUtil.loginPasswordValidator,
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
            onPressed: _loginUser,
            child: const Text("Login"),
          ),
          const SizedBox(height: 16),
          GoogleButton(onPressed: () {}, label: const Text("Login with Google"),),
        ],
      ),
    );
  }
}
