import 'package:cross_file/src/types/interface.dart';
import 'package:dio/dio.dart';
import 'package:todo_list_test/core/network/api_endpoint.dart';
import 'package:todo_list_test/core/network/dio_client.dart';

class AuthProvider {
  Future<Map<String, dynamic>> registerUser({
    required String userName,
    required String email,
    required String password,
  }) async {
    try {
      final response = await DioClient.instance.post(
        path: ApiRoutes.signUp,
        data: {
          "email": email,
          "username": userName,
          "password": password,
        },
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await DioClient.instance.post(
        path: ApiRoutes.signUp,
        data: {
          "email": email,
          "password": password,
        },
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }

  updateUser(
      {required String authToken,
      required String dateOfBirth,
      required String gender,
      required String location,
      required XFile image}) {}

  requestOtp({required String email}) {}

  verifyOtp({required String email, required String otp}) {}
}
