class Email {
  final String value;

  const Email(this.value);

  static bool isValid(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  factory Email.fromString(String email) {
    if (!isValid(email)) {
      throw FormatException('Invalid email format');
    }
    final validatedEmail = email;
    return Email(validatedEmail);
  }

  @override
  String toString() => value;
}
