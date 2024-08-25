import 'package:dio/dio.dart';
import 'package:todo_list_test/core/network/api_endpoint.dart';
import 'package:todo_list_test/core/network/dio_client.dart';

class TodoProvider {
  Future<Map<String, dynamic>> getTodos() async {
    try {
      final response = await DioClient.instance.get(
        path: ApiRoutes.todo,
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
}
