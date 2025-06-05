import 'package:flutter/material.dart';

class VerifyEmailModal extends StatelessWidget {
  final String email;
  const VerifyEmailModal({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Verify Your Email'),
      content: Text(
        'A verification link has been sent to $email. Please check your inbox.',
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('OK'),
        ),
      ],
    );
  }
}
