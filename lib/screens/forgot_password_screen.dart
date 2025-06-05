import 'package:flutter/material.dart';
import '../widgets/input_field.dart';
import '../widgets/primary_button.dart';
import '../core/utils/validators.dart';
import 'verify_email_modal.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
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
                      icon: Icon(Icons.chevron_left, color: textColor),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Forgot Password',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        color: textColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Text(
                  "Enter your email address below and an OTP will be sent to reset your password.",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    color: textColor.withOpacity(0.8),
                  ),
                ),
                const SizedBox(height: 24),
                InputField(
                  label: 'Email',
                  controller: _emailController,
                  validator: (value) => Validators.email(value?.trim()),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 12),
                Text(
                  "An OTP will be sent to the email address",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12,
                    color: textColor.withOpacity(0.7),
                  ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
