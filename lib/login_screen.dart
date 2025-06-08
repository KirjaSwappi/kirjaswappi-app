import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'sign_up_screen.dart';
import 'forget_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textColor = colorScheme.onSurface;
    final backgroundColor = Theme.of(context).brightness == Brightness.light
        ? const Color(0xFFF2F4F8)
        : colorScheme.surface;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 8),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        Icons.chevron_left,
                        size: 24,
                        color: textColor,
                      ),
                      onPressed: () {},
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Log in or sign up',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        color: textColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Column(
                  children: [
                    Theme(
                      data: Theme.of(context).copyWith(
                        inputDecorationTheme: const InputDecorationTheme(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            borderSide: BorderSide(
                              color: Color(0xFF3879E9),
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                      child: _InputField(label: 'Email'),
                    ),
                    const SizedBox(height: 12),
                    Theme(
                      data: Theme.of(context).copyWith(
                        inputDecorationTheme: const InputDecorationTheme(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            borderSide: BorderSide(
                              color: Color(0xFF3879E9),
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                      child: _InputField(label: 'Password', obscureText: true),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: _rememberMe,
                          checkColor: Colors.white,
                          fillColor: MaterialStateProperty.resolveWith<Color>((
                            states,
                          ) {
                            if (states.contains(MaterialState.selected)) {
                              return Theme.of(context).brightness ==
                                      Brightness.light
                                  ? const Color(0xFF3879E9)
                                  : colorScheme.primary;
                            } else {
                              return Theme.of(context).brightness ==
                                      Brightness.light
                                  ? const Color(0xFFF2F4F8)
                                  : colorScheme.surface;
                            }
                          }),
                          onChanged: (value) {
                            setState(() {
                              _rememberMe = value ?? false;
                            });
                          },
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "Remember me",
                          style: TextStyle(
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Colors.black
                                    : Colors.white,
                          ),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ForgetPasswordScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Colors.black
                                  : Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).brightness == Brightness.light
                            ? const Color(0xFF3879E9)
                            : colorScheme.primary,
                      ),
                      minimumSize: MaterialStateProperty.all(
                        const Size.fromHeight(42),
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      elevation: MaterialStateProperty.all(2),
                      overlayColor: MaterialStateProperty.resolveWith<Color?>((
                        Set<MaterialState> states,
                      ) {
                        if (states.contains(MaterialState.pressed)) {
                          return colorScheme.onPrimary.withOpacity(0.12);
                        }
                        return null;
                      }),
                    ),
                    child: Text(
                      "Continue",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        height: 1.0,
                        letterSpacing: 0,
                        color: colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: "Don't have an account? ",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: textColor,
                      ),
                      children: [
                        TextSpan(
                          text: "Create an account",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: colorScheme.primary,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignUpScreen(),
                                ),
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: colorScheme.outline.withOpacity(0.4),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text("or", style: TextStyle(color: textColor)),
                    ),
                    Expanded(
                      child: Divider(
                        color: colorScheme.outline.withOpacity(0.4),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  color: Colors.transparent,
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      backgroundColor:
                          Theme.of(context).brightness == Brightness.light
                              ? Colors.white
                              : colorScheme.surface,
                      minimumSize: const Size.fromHeight(42),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      side: BorderSide(
                        color: colorScheme.outline.withOpacity(0.4),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                    ),
                    icon: Image.asset(
                      'assets/images/google_icon.png',
                      width: 20,
                      height: 20,
                    ),
                    label: Text(
                      "Continue with Google",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        height: 1.0,
                        letterSpacing: 0,
                        color: colorScheme.onSurface,
                      ),
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

class _InputField extends StatefulWidget {
  final String label;
  final bool obscureText;

  const _InputField({required this.label, this.obscureText = false});

  @override
  State<_InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<_InputField> {
  late bool _obscureText;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {}); // rebuilds when focus changes
    });
  }

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textColor = colorScheme.onSurface;
    return TextField(
      obscureText: _obscureText,
      focusNode: _focusNode,
      style: TextStyle(color: textColor),
      decoration: InputDecoration(
        labelText: widget.label,
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(color: colorScheme.outline.withOpacity(0.4)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(color: colorScheme.outline.withOpacity(0.4)),
        ),
        fillColor: Theme.of(context).brightness == Brightness.light
            ? Colors.white
            : colorScheme.surface,
        filled: true,
        prefixIcon: widget.label.toLowerCase().contains('email')
            ? Icon(Icons.email, color: Theme.of(context).colorScheme.onSurface)
            : widget.label.toLowerCase().contains('password')
                ? Icon(Icons.lock,
                    color: Theme.of(context).colorScheme.onSurface)
                : null,
        suffixIcon: widget.obscureText
            ? IconButton(
                icon: Icon(
                  _obscureText
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: colorScheme.onSurface,
                ),
                onPressed: _toggleObscureText,
              )
            : null,
      ),
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
}
