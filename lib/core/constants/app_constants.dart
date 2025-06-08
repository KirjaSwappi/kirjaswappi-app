class AppConstants {
  // API Constants
  static const String baseUrl = 'YOUR_API_BASE_URL';

  // Storage Keys
  static const String tokenKey = 'auth_token';
  static const String userKey = 'user_data';

  // Validation Constants
  static const int minPasswordLength = 8;
  static const int maxPasswordLength = 32;

  // UI Constants
  static const double defaultPadding = 16.0;
  static const double defaultBorderRadius = 12.0;

  // Animation Durations
  static const Duration defaultAnimationDuration = Duration(milliseconds: 300);

  // Error Messages
  static const String genericErrorMessage =
      'Something went wrong. Please try again.';
  static const String networkErrorMessage =
      'Please check your internet connection.';
  static const String invalidCredentialsMessage = 'Invalid email or password.';
}
