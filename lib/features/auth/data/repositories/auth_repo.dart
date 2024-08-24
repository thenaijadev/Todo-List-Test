import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:todo_list_test/core/utils/logger.dart';
import 'package:todo_list_test/core/utils/typedef.dart';
import 'package:todo_list_test/features/auth/data/models/auth_error.dart';
import 'package:todo_list_test/features/auth/data/models/auth_user.dart';
import 'package:todo_list_test/features/auth/data/providers/auth_provider.dart';
import 'package:todo_list_test/features/auth/data/providers/local_provider.dart';

class AuthRepository {
  final AuthProvider provider;
  final AuthUserLocalDataSourceImpl localDataSource;
  AuthRepository({
    required this.localDataSource,
    required this.provider,
  });

  Future<EitherAuthUserOrAuthError> registerUser({
    required String userName,
    required String email,
    required String password,
  }) async {
    try {
      final response = await provider.registerUser(
        userName: userName,
        email: email,
        password: password,
      );
      await AuthUserLocalDataSourceImpl().saveUser(AuthUser.fromJson(response));
      logger.e(response.runtimeType);
      return right(AuthUser.fromJson(response));
    } on DioException catch (e) {
      return left(
        AuthError(
          errorMessage: e.response?.statusMessage ?? "There has been an error",
        ),
      );
    } catch (e) {
      return left(
        AuthError(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<EitherAuthUserOrAuthError> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await provider.login(email: email, password: password);
      final isSaved =
          await localDataSource.saveUser(AuthUser.fromJson(response));
      logger.f({isSaved: isSaved});
      return right(AuthUser.fromJson(response));
    } on DioException catch (e) {
      logger.f(e.response);

      return left(
        AuthError(
          errorMessage: json.decode(e.response.toString())["message"],
        ),
      );
    } catch (e) {
      return left(
        AuthError(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
