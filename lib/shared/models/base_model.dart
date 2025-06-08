abstract class BaseModel {
  Map<String, dynamic> toJson();

  @override
  String toString() {
    return toJson().toString();
  }
}

mixin TimestampMixin {
  DateTime? createdAt;
  DateTime? updatedAt;

  void setTimestamps() {
    final now = DateTime.now();
    createdAt ??= now;
    updatedAt = now;
  }
}

mixin IdMixin {
  String? id;
}
