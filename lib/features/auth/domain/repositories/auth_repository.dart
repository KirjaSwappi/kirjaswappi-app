import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../entities/user.dart';
import '../value_objects/email.dart';
import '../value_objects/password.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../data/services/auth_service.dart';

abstract class AuthRepository {
  Future<User> login({required Email email, required Password password});
  Future<User> signUp(
      {required String name, required Email email, required Password password});
  Future<User> verifyEmail({required Email email, required String otp});
  Future<void> resendVerificationEmail(Email email);
  Future<void> resetPassword(Email email);
  Future<void> verifyResetPasswordOTP(
      {required Email email, required String otp});
  Future<User> confirmResetPassword({
    required Email email,
    required String otp,
    required Password newPassword,
  });
  Future<void> logout();
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final authService = ref.watch(authServiceProvider);
  return AuthRepositoryImpl(authService);
});
