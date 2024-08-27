import 'package:get_it/get_it.dart';
import 'package:todo_list_test/features/auth/data/providers/auth_provider.dart';
import 'package:todo_list_test/features/auth/data/providers/local_provider.dart';
import 'package:todo_list_test/features/auth/data/repositories/auth_repo.dart';
import 'package:todo_list_test/features/todos/data/providers/todo_provider.dart';
import 'package:todo_list_test/features/todos/data/repositories/todo_repositories.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<AuthProvider>(AuthProvider());
  getIt.registerSingleton<AuthUserLocalDataSourceImpl>(
      AuthUserLocalDataSourceImpl());

  getIt.registerSingleton<AuthRepository>(
      AuthRepository(localDataSource: getIt(), provider: getIt()));
  getIt.registerSingleton<TodoProvider>(TodoProvider());

  getIt.registerSingleton<TodoRepository>(TodoRepository(provider: getIt()));
}
