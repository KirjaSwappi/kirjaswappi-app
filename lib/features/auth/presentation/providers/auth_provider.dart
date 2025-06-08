import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/value_objects/email.dart';
import '../../domain/value_objects/password.dart';

final authProvider =
    StateNotifierProvider<AuthNotifier, AsyncValue<User?>>((ref) {
  return AuthNotifier(ref.watch(authRepositoryProvider));
});

class AuthNotifier extends StateNotifier<AsyncValue<User?>> {
  final AuthRepository _authRepository;

  AuthNotifier(this._authRepository) : super(const AsyncValue.data(null));

  bool get isLoading => state.isLoading;

  Future<void> login({required String email, required String password}) async {
    state = const AsyncValue.loading();
    try {
      final user = await _authRepository.login(
        email: Email.fromString(email),
        password: Password.fromString(password),
      );
      state = AsyncValue.data(user);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
      rethrow;
    }
  }

  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    state = const AsyncValue.loading();
    try {
      final user = await _authRepository.signUp(
        name: name,
        email: Email.fromString(email),
        password: Password.fromString(password),
      );
      state = AsyncValue.data(user);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
      rethrow;
    }
  }

  Future<void> verifyEmail({required String email, required String otp}) async {
    state = const AsyncValue.loading();
    try {
      final user = await _authRepository.verifyEmail(
        email: Email.fromString(email),
        otp: otp,
      );
      state = AsyncValue.data(user);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
      rethrow;
    }
  }

  Future<void> resendVerificationEmail(String email) async {
    try {
      await _authRepository.resendVerificationEmail(Email.fromString(email));
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
      rethrow;
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      await _authRepository.resetPassword(Email.fromString(email));
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
      rethrow;
    }
  }

  Future<void> verifyResetPasswordOTP({
    required String email,
    required String otp,
  }) async {
    try {
      await _authRepository.verifyResetPasswordOTP(
        email: Email.fromString(email),
        otp: otp,
      );
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
      rethrow;
    }
  }

  Future<void> confirmResetPassword({
    required String email,
    required String otp,
    required String newPassword,
  }) async {
    state = const AsyncValue.loading();
    try {
      final user = await _authRepository.confirmResetPassword(
        email: Email.fromString(email),
        otp: otp,
        newPassword: Password.fromString(newPassword),
      );
      state = AsyncValue.data(user);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
      rethrow;
    }
  }

  Future<void> logout() async {
    state = const AsyncValue.loading();
    try {
      await _authRepository.logout();
      state = const AsyncValue.data(null);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
      rethrow;
    }
  }
}
