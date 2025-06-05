// lib/screens/reset_password_screen.dart

import 'package:flutter/material.dart';
import '../widgets/password_field.dart';
import '../widgets/primary_button.dart';
import '../core/utils/validators.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      // TODO: Handle actual reset password logic
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password successfully reset')),
      );
      Navigator.pop(context); // Or navigate to login screen
    }
  }

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).colorScheme.onSurface;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.chevron_left, color: textColor),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Reset Password',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        color: textColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                PasswordField(
                  controller: _passwordController,
                  label: 'New Password',
                  validator: Validators.password,
                ),
                const SizedBox(height: 12),
                PasswordField(
                  controller: _confirmPasswordController,
                  label: 'Confirm Password',
                  validator: (value) {
                    if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                PrimaryButton(text: "Continue", onPressed: _handleSubmit),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
