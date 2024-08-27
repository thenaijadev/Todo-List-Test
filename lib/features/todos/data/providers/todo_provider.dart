import 'package:dio/dio.dart';
import 'package:todo_list_test/core/network/api_endpoint.dart';
import 'package:todo_list_test/core/network/dio_client.dart';
import 'package:todo_list_test/features/todos/data/models/todo.dart';

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

  Future<Map<String, dynamic>> createTodo(
      {required String title,
      required String subtitle,
      required bool isCompleted}) async {
    try {
      final response = await DioClient.instance.post(
        path: ApiRoutes.todo,
        data: {"title": title, "subtitle": subtitle, "completed": isCompleted},
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

  Future<Map<String, dynamic>> updateTodo({required Todo todo}) async {
    try {
      final response = await DioClient.instance.put(
        path: ApiRoutes.updateTodo,
        data: todo.toJson(),
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

  Future<Map<String, dynamic>> deleteTodo({required Todo todo}) async {
    try {
      final response = await DioClient.instance.put(
        path: ApiRoutes.deleteTodo,
        data: todo.toJson(),
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
