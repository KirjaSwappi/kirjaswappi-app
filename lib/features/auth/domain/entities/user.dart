class User {
  final String id;
  final String name;
  final String email;
  final bool isEmailVerified;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.isEmailVerified,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      isEmailVerified: json['isEmailVerified'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'isEmailVerified': isEmailVerified,
    };
  }

  User copyWith({
    String? id,
    String? name,
    String? email,
    bool? isEmailVerified,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
    );
  }
}
