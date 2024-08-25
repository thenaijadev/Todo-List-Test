import 'package:dartz/dartz.dart';
import 'package:todo_list_test/features/auth/data/models/auth_error.dart';
import 'package:todo_list_test/features/auth/data/models/auth_user.dart';
import 'package:todo_list_test/features/todos/data/models/todo_error.dart';
import 'package:todo_list_test/features/todos/data/models/todo_models.dart';

typedef EitherAuthUserOrAuthError = Either<AuthError, AuthUser>;
typedef EitherTrueOrAuthError = Either<AuthError, bool>;

typedef EitherFutureTrueOrAuthError = Future<Either<AuthError, bool>>;
typedef EitherFutureTodoErrorOrTodoModel = Either<TodoError, TodosModel>;
