import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/widgets/base_widgets.dart';
import '../../../../core/utils/app_utils.dart';
import '../providers/auth_provider.dart';
import 'verify_email_modal.dart';

class ForgetPasswordScreen extends ConsumerStatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  ConsumerState<ForgetPasswordScreen> createState() =>
      _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends ConsumerState<ForgetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _handleResetPassword() async {
    if (!_formKey.currentState!.validate()) return;

    try {
      await ref
          .read(authProvider.notifier)
          .resetPassword(_emailController.text.trim());
      if (mounted) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => const VerifyEmailModal(),
        );
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

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.chevron_left, size: 24),
                    padding: EdgeInsets.zero,
                    onPressed: () => context.pop(),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Forget Password',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Enter your email address below and an OTP will send to your email to reset your password.",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.8),
                      ),
                    ),
                    const SizedBox(height: 24),
                    AppTextField(
                      label: "Email",
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is required';
                        }
                        if (!AppUtils.isValidEmail(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "An OTP will be sent to the email address",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.7),
                      ),
                    ),
                    const SizedBox(height: 20),
                    AppButton(
                      text: "Continue",
                      onPressed: _handleResetPassword,
                      isLoading: isLoading,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
