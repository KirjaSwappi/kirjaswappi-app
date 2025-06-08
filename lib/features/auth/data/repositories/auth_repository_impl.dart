import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/value_objects/email.dart';
import '../../domain/value_objects/password.dart';
import '../services/auth_service.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthService _authService;

  AuthRepositoryImpl(this._authService);

  @override
  Future<User> login({required Email email, required Password password}) async {
    final user = await _authService.login(
      email: email.toString(),
      password: password.toString(),
    );
    return user;
  }

  @override
  Future<User> signUp(
      {required String name,
      required Email email,
      required Password password}) async {
    final user = await _authService.signUp(
      name: name,
      email: email.toString(),
      password: password.toString(),
    );
    return user;
  }

  @override
  Future<User> verifyEmail({required Email email, required String otp}) async {
    final user = await _authService.verifyEmail(
      email: email.toString(),
      otp: otp,
    );
    return user;
  }

  @override
  Future<void> resendVerificationEmail(Email email) async {
    await _authService.resendVerificationEmail(email.toString());
  }

  @override
  Future<void> resetPassword(Email email) async {
    await _authService.resetPassword(email.toString());
  }

  @override
  Future<void> verifyResetPasswordOTP(
      {required Email email, required String otp}) async {
    await _authService.verifyResetPasswordOTP(
      email: email.toString(),
      otp: otp,
    );
  }

  @override
  Future<User> confirmResetPassword({
    required Email email,
    required String otp,
    required Password newPassword,
  }) async {
    final user = await _authService.confirmResetPassword(
      email: email.toString(),
      otp: otp,
      newPassword: newPassword.toString(),
    );
    return user;
  }

  @override
  Future<void> logout() async {
    await _authService.logout();
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final authService = ref.watch(authServiceProvider);
  return AuthRepositoryImpl(authService);
});
