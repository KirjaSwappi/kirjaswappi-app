import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'login_screen.dart';
import 'sign_up_screen.dart';
import 'reset_password_screen.dart';
import 'forget_password_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF3879E9);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Practice App',
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: const Color(0xFFF2F4F8),
        primaryColor: primaryColor,
        colorScheme: const ColorScheme.light(
          primary: primaryColor,
          onPrimary: Colors.white,
          surface: Colors.white,
          onSurface: Colors.black,
          outline: Colors.grey,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: primaryColor,
        colorScheme: const ColorScheme.dark(
          primary: primaryColor,
          onPrimary: Colors.white,
          surface: Color(0xFF1E1E1E),
          onSurface: Colors.white,
          outline: Colors.grey,
        ),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      home: const LoginScreen(),
      routes: {
        '/signup': (context) => const SignUpScreen(),
        '/reset-password': (context) => const ResetPasswordScreen(),
        '/forget-password': (context) => const ForgetPasswordScreen(),
      },
    );
  }
}
