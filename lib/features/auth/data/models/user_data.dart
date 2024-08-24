import 'dart:convert';

import 'package:image_picker/image_picker.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserData {
  final String? email;
  final String? userName;
  final String? password;
  final String? confirmPassword;
  final String? phoneNumber;
  final String? countryCode;
  final String? dateOfBirth;
  final String? gender;
  final bool? showGender;
  final String? location;
  final XFile? profileImage;
  final String? token;
  UserData({
    this.email,
    this.userName,
    this.password,
    this.confirmPassword,
    this.phoneNumber,
    this.countryCode,
    this.dateOfBirth,
    this.gender,
    this.showGender,
    this.location,
    this.profileImage,
    this.token,
  });

  UserData copyWith({
    String? email,
    String? fullName,
    String? password,
    String? confirmPassword,
    String? phoneNumber,
    String? countryCode,
    String? dateOfBirth,
    String? gender,
    bool? showGender,
    String? location,
    XFile? profileImage,
    String? token,
  }) {
    return UserData(
      email: email ?? this.email,
      userName: fullName ?? userName,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      countryCode: countryCode ?? this.countryCode,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      gender: gender ?? this.gender,
      showGender: showGender ?? this.showGender,
      location: location ?? this.location,
      profileImage: profileImage ?? this.profileImage,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'fullName': userName,
      'password': password,
      'confirmPassword': confirmPassword,
      'phoneNumber': phoneNumber,
      'countryCode': countryCode,
      'dateOfBirth': dateOfBirth,
      'gender': gender,
      'showGender': showGender,
      'location': location,
      'profileImage': profileImage,
      'token': token,
    };
  }

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      email: map['email'] != null ? map['email'] as String : null,
      userName: map['fullName'] != null ? map['fullName'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      confirmPassword: map['confirmPassword'] != null
          ? map['confirmPassword'] as String
          : null,
      phoneNumber:
          map['phoneNumber'] != null ? map['phoneNumber'] as String : null,
      countryCode:
          map['countryCode'] != null ? map['countryCode'] as String : null,
      dateOfBirth:
          map['dateOfBirth'] != null ? map['dateOfBirth'] as String : null,
      gender: map['gender'] != null ? map['gender'] as String : null,
      showGender: map['showGender'] != null ? map['showGender'] as bool : null,
      location: map['location'] != null ? map['location'] as String : null,
      profileImage:
          map['profileImage'] != null ? map['profileImage'] as XFile : null,
      token: map['token'] != null ? map['token'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserData.fromJson(String source) =>
      UserData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserData(email: $email, fullName: $userName, password: $password, confirmPassword: $confirmPassword, phoneNumber: $phoneNumber, countryCode: $countryCode, dateOfBirth: $dateOfBirth, gender: $gender, showGender: $showGender, location: $location, profileImage: $profileImage, token: $token)';
  }

  @override
  bool operator ==(covariant UserData other) {
    if (identical(this, other)) return true;

    return other.email == email &&
        other.userName == userName &&
        other.password == password &&
        other.confirmPassword == confirmPassword &&
        other.phoneNumber == phoneNumber &&
        other.countryCode == countryCode &&
        other.dateOfBirth == dateOfBirth &&
        other.gender == gender &&
        other.showGender == showGender &&
        other.location == location &&
        other.profileImage == profileImage &&
        other.token == token;
  }

  @override
  int get hashCode {
    return email.hashCode ^
        userName.hashCode ^
        password.hashCode ^
        confirmPassword.hashCode ^
        phoneNumber.hashCode ^
        countryCode.hashCode ^
        dateOfBirth.hashCode ^
        gender.hashCode ^
        showGender.hashCode ^
        location.hashCode ^
        profileImage.hashCode ^
        token.hashCode;
  }
}
