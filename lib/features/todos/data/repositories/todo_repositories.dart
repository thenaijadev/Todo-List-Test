// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:todo_list_test/core/utils/logger.dart';
import 'package:todo_list_test/core/utils/typedef.dart';
import 'package:todo_list_test/features/todos/data/models/todo.dart';
import 'package:todo_list_test/features/todos/data/models/todo_error.dart';
import 'package:todo_list_test/features/todos/data/models/todo_models.dart';
import 'package:todo_list_test/features/todos/data/providers/local_todo_list_provider.dart';
import 'package:todo_list_test/features/todos/data/providers/todo_provider.dart';
import 'package:uuid/uuid.dart';

class TodoRepository {
  final TodoProvider provider;
  TodoRepository({
    required this.provider,
  });
  Future<EitherFutureTodoErrorOrTodoModel> getTodos() async {
    try {
      final response = await provider.getTodos();
      logger.f(response);
      await LocalTodoListProvider().saveTodos(TodosModel.fromJson(response));

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

  Future<EitherFutureTodoErrorOrTodoModel> createTodo(
      {required String title,
      required String subtitle,
      required bool isCompleted}) async {
    try {
      final response = await provider.createTodo(
          title: title, subtitle: subtitle, isCompleted: isCompleted);
      logger.f(response);
      final localTodos = await LocalTodoListProvider().getTodos();
      localTodos?.data.add(Todo(
          id: const Uuid().v4(),
          title: title,
          subtitle: subtitle,
          completed: isCompleted));
      await LocalTodoListProvider().saveTodos(localTodos!);

      return right(localTodos);
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

  Future<EitherFutureTodoErrorOrTodoModel> updateTodo(
      {required Todo todo}) async {
    try {
      await provider.updateTodo(todo: todo);

      final todos = await LocalTodoListProvider().getTodos();
      int index = todos!.data.indexWhere((singleTodo) {
        logger.f([singleTodo.id, todo.id]);

        return singleTodo.id == todo.id;
      });

      todos.data[index] = todo;
      await LocalTodoListProvider().saveTodos(todos);
      return right(todos);
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

  Future<EitherFutureTodoErrorOrTodoModel> deleteTodo(
      {required Todo todo}) async {
    try {
      await provider.updateTodo(todo: todo);
      final todos = await LocalTodoListProvider().getTodos();
      int index = todos!.data.indexWhere((singleTodo) {
        logger.f([singleTodo.id, todo.id]);

        return singleTodo.id == todo.id;
      });

      todos.data.removeAt(index);
      await LocalTodoListProvider().saveTodos(todos);
      return right(todos);
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
