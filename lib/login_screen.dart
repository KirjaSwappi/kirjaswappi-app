import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ...implement your login UI here...
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(child: Text('Login Screen')),
    );
  }
}
