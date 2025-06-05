import 'package:flutter/material.dart';
import '../widgets/primary_button.dart';
import 'reset_password_screen.dart';

class VerifyEmailModal extends StatefulWidget {
  const VerifyEmailModal({super.key});

  @override
  State<VerifyEmailModal> createState() => _VerifyEmailModalState();
}

class _VerifyEmailModalState extends State<VerifyEmailModal> {
  String _otpCode = '';

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textColor = colorScheme.onSurface;
    final backgroundColor = Theme.of(context).brightness == Brightness.light
        ? Colors.white
        : colorScheme.surface;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.3),
        body: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 64),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(20),
            ),
            width: 360,
            child: Column(
              mainAxisSize: MainAxisSize.min,
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
                      'Create an Account',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: textColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                const Text(
                  "Confirm your Email",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  "Enter the code we've sent to your Email",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: textColor.withOpacity(0.7),
                  ),
                ),
                const SizedBox(height: 24),
                _OtpFields(onOtpChanged: (otp) => _otpCode = otp),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Haven't received a code? ",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 13,
                        color: textColor.withOpacity(0.7),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // TODO: Resend OTP
                      },
                      child: Text(
                        "Send again",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: colorScheme.primary,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                PrimaryButton(
                  text: "Continue",
                  onPressed: () {
                    if (_otpCode == '111111') {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (_) => const ResetPasswordScreen(),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Incorrect OTP. Please try again."),
                        ),
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

class _OtpFields extends StatefulWidget {
  final void Function(String) onOtpChanged;
  const _OtpFields({required this.onOtpChanged});

  @override
  State<_OtpFields> createState() => _OtpFieldsState();
}

class _OtpFieldsState extends State<_OtpFields> {
  final List<TextEditingController> _controllers = List.generate(
    6,
    (_) => TextEditingController(),
  );

  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    for (final f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.6),
        width: 1.4,
      ),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(6, (i) {
        return SizedBox(
          width: 40,
          child: TextField(
            controller: _controllers[i],
            focusNode: _focusNodes[i],
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            maxLength: 1,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 18,
              fontWeight: FontWeight.w600,
              letterSpacing: 2,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            decoration: InputDecoration(
              counterText: '',
              border: border,
              enabledBorder: border,
              focusedBorder: border.copyWith(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                  width: 2,
                ),
              ),
              filled: true,
              fillColor: Theme.of(context).brightness == Brightness.light
                  ? Colors.white
                  : Theme.of(context).colorScheme.surface,
              contentPadding: const EdgeInsets.symmetric(vertical: 12),
            ),
            onChanged: (value) {
              if (value.length == 1 && i < 5) {
                _focusNodes[i + 1].requestFocus();
              } else if (value.isEmpty && i > 0) {
                _focusNodes[i - 1].requestFocus();
              }
              widget.onOtpChanged(_controllers.map((c) => c.text).join());
            },
          ),
        );
      }),
    );
  }
}
