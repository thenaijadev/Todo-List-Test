import 'package:dartz/dartz.dart';
import 'package:todo_list_test/features/auth/data/models/auth_error.dart';
import 'package:todo_list_test/features/auth/data/models/auth_user.dart';

typedef EitherAuthUserOrAuthError = Either<AuthError, AuthUser>;
typedef EitherTrueOrAuthError = Either<AuthError, bool>;

typedef EitherFutureTrueOrAuthError = Future<Either<AuthError, bool>>;
