import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/gestures.dart';
import '../../../../core/utils/app_utils.dart';
import '../providers/auth_provider.dart';

class VerifyEmailModal extends ConsumerStatefulWidget {
  final String? email;
  final bool isResetPassword;

  const VerifyEmailModal({
    super.key,
    this.email,
    this.isResetPassword = false,
  });

  @override
  ConsumerState<VerifyEmailModal> createState() => _VerifyEmailModalState();
}

class _VerifyEmailModalState extends ConsumerState<VerifyEmailModal> {
  final List<TextEditingController> _otpControllers =
      List.generate(6, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());

  @override
  void dispose() {
    for (final c in _otpControllers) {
      c.dispose();
    }
    for (final f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  String get _otp => _otpControllers.map((c) => c.text).join();

  Future<void> _handleVerifyEmail() async {
    if (_otp.length != 6) {
      AppUtils.showSnackBar(context, 'OTP must be 6 digits');
      return;
    }
    try {
      if (widget.isResetPassword) {
        await ref.read(authProvider.notifier).verifyResetPasswordOTP(
              email: widget.email!,
              otp: _otp,
            );
        if (mounted) {
          context.pop();
          context.push('/reset-password?email=${widget.email}&otp=$_otp');
        }
      } else {
        await ref.read(authProvider.notifier).verifyEmail(
              email: widget.email!,
              otp: _otp,
            );
        if (mounted) {
          context.pop();
          context.go('/login');
        }
      }
    } catch (e) {
      if (mounted) {
        AppUtils.showSnackBar(context, e.toString());
      }
    }
  }

  Future<void> _handleResendOTP() async {
    try {
      if (widget.isResetPassword) {
        await ref.read(authProvider.notifier).resetPassword(widget.email!);
      } else {
        await ref
            .read(authProvider.notifier)
            .resendVerificationEmail(widget.email!);
      }
      if (mounted) {
        AppUtils.showSnackBar(context, 'OTP has been resent to your email');
      }
    } catch (e) {
      if (mounted) {
        AppUtils.showSnackBar(context, e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    final isLoading = authState.isLoading;
    final colorScheme = Theme.of(context).colorScheme;
    final textColor = colorScheme.onSurface;
    final backgroundColor = Colors.white;
    final borderRadius = BorderRadius.circular(20);
    final otpBoxColor = const Color(0xFFF2F4F8);
    final blue = const Color(0xFF3879E9);
    final headerTextStyle = TextStyle(
      fontFamily: 'Poppins',
      fontSize: 13,
      color: Colors.grey[600],
      fontWeight: FontWeight.w400,
    );

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 64),
      child: Center(
        child: Container(
          width: 360,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: borderRadius,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Top bar
                Row(
                  children: [
                    IconButton(
                      icon:
                          Icon(Icons.chevron_left, color: textColor, size: 24),
                      padding: EdgeInsets.zero,
                      onPressed: () => Navigator.pop(context),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          'log in or signup',
                          style: headerTextStyle,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.close, color: textColor, size: 22),
                      padding: EdgeInsets.zero,
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Title
                Center(
                  child: Text(
                    'Confirm your Email',
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                // Subtext
                Center(
                  child: Text(
                    "Enter the code we've sent to your Email",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: textColor.withOpacity(0.7),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                // OTP fields
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(6, (i) {
                    return Container(
                      width: 44,
                      height: 48,
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        color: otpBoxColor,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: _otpControllers[i].text.isNotEmpty
                              ? blue
                              : otpBoxColor,
                          width: 1.5,
                        ),
                      ),
                      child: Center(
                        child: TextField(
                          controller: _otpControllers[i],
                          focusNode: _focusNodes[i],
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 2,
                            color: Colors.black,
                          ),
                          decoration: const InputDecoration(
                            counterText: '',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.zero,
                          ),
                          onChanged: (value) {
                            setState(() {});
                            if (value.length == 1 && i < 5) {
                              _focusNodes[i + 1].requestFocus();
                            }
                            if (value.isEmpty && i > 0) {
                              _focusNodes[i - 1].requestFocus();
                            }
                          },
                        ),
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 20),
                // Resend
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: "Haven't received a code? ",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 13,
                        color: textColor.withOpacity(0.7),
                      ),
                      children: [
                        TextSpan(
                          text: 'Send again',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 13,
                            color: blue,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w500,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = _handleResendOTP,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                // Continue button
                SizedBox(
                  height: 48,
                  child: ElevatedButton(
                    onPressed: isLoading ? null : _handleVerifyEmail,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: blue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: isLoading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          )
                        : const Text(
                            "Continue",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
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
