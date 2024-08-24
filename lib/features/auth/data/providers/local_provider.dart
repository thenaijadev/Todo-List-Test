import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list_test/core/utils/typedef.dart';
import 'package:todo_list_test/features/auth/data/models/auth_error.dart';
import 'package:todo_list_test/features/auth/data/models/auth_user.dart';

class AuthUserLocalDataSourceImpl {
  AuthUserLocalDataSourceImpl._internal({
    required this.sharedPreferences,
    this.cachedUser = 'CACHED_AUTHUSER',
  });

  static final AuthUserLocalDataSourceImpl _instance =
      AuthUserLocalDataSourceImpl._internal(
          sharedPreferences: Future.value(SharedPreferences.getInstance()));

  factory AuthUserLocalDataSourceImpl() {
    return _instance;
  }

  final Future<SharedPreferences> sharedPreferences;
  final String cachedUser;

  Future<AuthUser?> getUser() async {
    final jsonString = await AuthUserLocalDataSourceImpl()
        .sharedPreferences
        .then((value) => value.getString(cachedUser));

    try {
      if (jsonString != null) {
        final userModel =
            await Future.value(AuthUser.fromJson(json.decode(jsonString)));

        return userModel;
      }
    } finally {}
    return null;
  }

  Future<bool> saveUser(AuthUser user) async {
    final preferences = await sharedPreferences;

    final isSaved = await preferences.setString(
      cachedUser,
      json.encode(
        user.toJson(),
      ),
    );
    if (isSaved) {
      return true;
    } else {
      return false;
    }
  }

  EitherFutureTrueOrAuthError deleteUser() async {
    try {
      final preferences = await sharedPreferences;
      bool isDeleted = await preferences.remove(cachedUser);
      return right(isDeleted);
    } catch (e) {
      return left(AuthError(
          errorMessage: "There has been an error deleting the user locally"));
    }
  }
}
