import 'package:e_begal_shield_rewritten/global/utils/validator.util.dart';
import 'package:e_begal_shield_rewritten/global/widgets/fields/highlighted_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                textStyle: Theme.of(context).textTheme.labelMedium,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                shadowColor: Colors.transparent,
                padding: const EdgeInsets.symmetric(vertical: 16)),
            child: const Text("Login"),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 232, 232, 232),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              textStyle: Theme.of(context).textTheme.labelSmall,
              foregroundColor: Theme.of(context).colorScheme.tertiary,
              shadowColor: Colors.transparent,
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            label: const Text("Login with Google"),
            icon: Logo(Logos.google, size: 24),
          ),
        ],
      ),
    );
  }
}
