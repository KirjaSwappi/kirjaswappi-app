class UserModel {
  final String id;
  final String name;
  final String email;
  final bool isEmailVerified;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.isEmailVerified,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
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

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    bool? isEmailVerified,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
    );
  }
}
