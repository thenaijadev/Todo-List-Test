import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserData {
  final String? email;
  final String? userName;
  final String? password;

  UserData({
    this.email,
    this.userName,
    this.password,
  });

  UserData copyWith({
    String? email,
    String? fullName,
    String? password,
  }) {
    return UserData(
      email: email ?? this.email,
      userName: fullName ?? userName,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'fullName': userName,
      'password': password,
    };
  }

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      email: map['email'] != null ? map['email'] as String : null,
      userName: map['fullName'] != null ? map['fullName'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserData.fromJson(String source) =>
      UserData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant UserData other) {
    if (identical(this, other)) return true;

    return other.email == email &&
        other.userName == userName &&
        other.password == password;
  }

  @override
  int get hashCode {
    return email.hashCode ^ userName.hashCode ^ password.hashCode;
  }
}
