class PasswordResetModel {
  PasswordResetModel({
    required this.message,
  });

  final String? message;

  PasswordResetModel copyWith({
    String? message,
  }) {
    return PasswordResetModel(
      message: message ?? this.message,
    );
  }

  factory PasswordResetModel.fromJson(Map<String, dynamic> json) {
    return PasswordResetModel(
      message: json["message"],
    );
  }

  Map<String, dynamic> toJson() => {
        "message": message,
      };

  @override
  String toString() {
    return "$message, ";
  }
}
