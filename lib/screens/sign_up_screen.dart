import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../core/utils/validators.dart';
import '../widgets/input_field.dart';
import '../widgets/password_field.dart';
import '../widgets/primary_button.dart';
import 'verify_email_modal.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _rememberMe = false;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) return 'Confirm password';
    if (value != _passwordController.text) return 'Passwords do not match';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textColor = colorScheme.onSurface;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.chevron_left,
                        size: 24,
                        color: textColor,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Create an Account',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        color: textColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                InputField(
                  controller: _firstNameController,
                  label: 'First Name',
                  validator: (value) =>
                      Validators.notEmpty(value, 'First name'),
                ),
                const SizedBox(height: 12),
                InputField(
                  controller: _lastNameController,
                  label: 'Last Name',
                  validator: (value) => Validators.notEmpty(value, 'Last name'),
                ),
                const SizedBox(height: 12),
                InputField(
                  controller: _emailController,
                  label: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  validator: Validators.email,
                ),
                const SizedBox(height: 12),
                PasswordField(
                  controller: _passwordController,
                  label: 'Password',
                  validator: Validators.password,
                ),
                const SizedBox(height: 12),
                PasswordField(
                  controller: _confirmPasswordController,
                  label: 'Confirm Password',
                  validator: _validateConfirmPassword,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Checkbox(
                      value: _rememberMe,
                      activeColor: colorScheme.primary,
                      onChanged: (value) =>
                          setState(() => _rememberMe = value ?? false),
                    ),
                    const SizedBox(width: 8),
                    Text("Remember me", style: TextStyle(color: textColor)),
                  ],
                ),
                const SizedBox(height: 20),
                PrimaryButton(
                  text: "Continue",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) => const VerifyEmailModal(),
                      );
                    }
                  },
                ),
                const SizedBox(height: 16),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: "Already have an account? ",
                      style: TextStyle(color: textColor),
                      children: [
                        TextSpan(
                          text: "Log in",
                          style: TextStyle(
                            color: colorScheme.primary,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Navigator.pop(context),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
