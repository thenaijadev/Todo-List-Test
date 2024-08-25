import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list_test/core/utils/typedef.dart';
import 'package:todo_list_test/features/auth/data/models/auth_error.dart';
import 'package:todo_list_test/features/todos/data/models/todo_models.dart';

class LocalTodoListProvider {
  LocalTodoListProvider._internal({
    required this.sharedPreferences,
    this.cachedTodos = 'CACHED_TODOS',
  });

  static final LocalTodoListProvider _instance =
      LocalTodoListProvider._internal(
          sharedPreferences: Future.value(SharedPreferences.getInstance()));

  factory LocalTodoListProvider() {
    return _instance;
  }

  final Future<SharedPreferences> sharedPreferences;
  final String cachedTodos;

  Future<TodosModel?> getTodos() async {
    final jsonString = await LocalTodoListProvider()
        .sharedPreferences
        .then((value) => value.getString(cachedTodos));

    try {
      if (jsonString != null) {
        final todosModel =
            await Future.value(TodosModel.fromJson(json.decode(jsonString)));

        return todosModel;
      }
    } finally {}
    return null;
  }

  Future<bool> saveTodos(TodosModel todos) async {
    final preferences = await sharedPreferences;

    final isSaved = await preferences.setString(
      cachedTodos,
      json.encode(
        todos.toJson(),
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
      bool isDeleted = await preferences.remove(cachedTodos);
      return right(isDeleted);
    } catch (e) {
      return left(AuthError(
          errorMessage: "There has been an error deleting the user locally"));
    }
  }
}
