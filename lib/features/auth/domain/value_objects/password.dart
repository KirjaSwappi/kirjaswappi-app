class Password {
  final String value;

  const Password(this.value);

  static bool isValid(String password) {
    return password.length >= 6;
  }

  factory Password.fromString(String password) {
    if (!isValid(password)) {
      throw FormatException('Password must be at least 6 characters');
    }
    return Password(password);
  }

  @override
  String toString() => value;
}
