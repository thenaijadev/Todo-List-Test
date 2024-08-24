// ignore_for_file: public_member_api_docs, sort_constructors_first
class AuthUser {
  AuthUser({
    required this.status,
    required this.code,
    required this.message,
    required this.data,
  });

  final String? status;
  final int? code;
  final String? message;
  final Data? data;

  factory AuthUser.fromJson(Map<String, dynamic> json) {
    return AuthUser(
      status: json["status"],
      code: json["code"],
      message: json["message"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
        "data": data?.toJson(),
      };

  @override
  String toString() {
    return 'AuthUser(status: $status, code: $code, message: $message, data: $data)';
  }
}

class Data {
  Data({
    required this.id,
    required this.username,
    required this.email,
    required this.token,
  });

  final String? id;
  final String? username;
  final String? email;
  final Token? token;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json["id"],
      username: json["username"],
      email: json["email"],
      token: json["token"] == null ? null : Token.fromJson(json["token"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "token": token?.toJson(),
      };
}

class Token {
  Token({
    required this.accessToken,
    required this.refreshToken,
    required this.expiresIn,
  });

  final String? accessToken;
  final String? refreshToken;
  final int? expiresIn;

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
      accessToken: json["access_token"],
      refreshToken: json["refresh_token"],
      expiresIn: json["expires_in"],
    );
  }

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "refresh_token": refreshToken,
        "expires_in": expiresIn,
      };
}
