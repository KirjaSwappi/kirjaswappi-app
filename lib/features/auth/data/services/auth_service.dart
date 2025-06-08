import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/user.dart';

abstract class AuthService {
  Future<User> login({required String email, required String password});
  Future<User> signUp(
      {required String name, required String email, required String password});
  Future<User> verifyEmail({required String email, required String otp});
  Future<void> resendVerificationEmail(String email);
  Future<void> resetPassword(String email);
  Future<void> verifyResetPasswordOTP(
      {required String email, required String otp});
  Future<User> confirmResetPassword({
    required String email,
    required String otp,
    required String newPassword,
  });
  Future<void> logout();
}

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthServiceImpl();
});

class AuthServiceImpl implements AuthService {
  @override
  Future<User> login({required String email, required String password}) async {
    // TODO: Implement actual login logic
    return User(
      id: '1',
      name: 'Test User',
      email: email,
      isEmailVerified: false,
    );
  }

  @override
  Future<User> signUp(
      {required String name,
      required String email,
      required String password}) async {
    // TODO: Implement actual signup logic
    return User(
      id: '1',
      name: name,
      email: email,
      isEmailVerified: false,
    );
  }

  @override
  Future<User> verifyEmail({required String email, required String otp}) async {
    // TODO: Implement actual email verification logic
    return User(
      id: '1',
      name: 'Test User',
      email: email,
      isEmailVerified: true,
    );
  }

  @override
  Future<void> resendVerificationEmail(String email) async {
    // TODO: Implement actual resend verification email logic
  }

  @override
  Future<void> resetPassword(String email) async {
    // TODO: Implement actual reset password logic
  }

  @override
  Future<void> verifyResetPasswordOTP(
      {required String email, required String otp}) async {
    // TODO: Implement actual OTP verification logic
  }

  @override
  Future<User> confirmResetPassword({
    required String email,
    required String otp,
    required String newPassword,
  }) async {
    // TODO: Implement actual password reset confirmation logic
    return User(
      id: '1',
      name: 'Test User',
      email: email,
      isEmailVerified: true,
    );
  }

  @override
  Future<void> logout() async {
    // TODO: Implement actual logout logic
  }
}
