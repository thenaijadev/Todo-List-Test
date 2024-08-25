// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:todo_list_test/core/utils/logger.dart';
import 'package:todo_list_test/core/utils/typedef.dart';
import 'package:todo_list_test/features/todos/data/models/todo_error.dart';
import 'package:todo_list_test/features/todos/data/models/todo_models.dart';
import 'package:todo_list_test/features/todos/data/providers/todo_provider.dart';

class TodoRepository {
  final TodoProvider provider;
  TodoRepository({
    required this.provider,
  });
  Future<EitherFutureTodoErrorOrTodoModel> getTodos() async {
    try {
      final response = await provider.getTodos();

      return right(TodosModel.fromJson(response));
    } on DioException catch (e) {
      logger.f(e.response);

      return left(
        TodoError(
          errorMessage: json.decode(e.response.toString())["message"],
        ),
      );
    } catch (e) {
      return left(
        TodoError(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
