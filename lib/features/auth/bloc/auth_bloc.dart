import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_list_test/features/auth/data/models/auth_error.dart';
import 'package:todo_list_test/features/auth/data/models/auth_user.dart';
import 'package:todo_list_test/features/auth/data/models/user_data.dart';
import 'package:todo_list_test/features/auth/data/repositories/auth_repo.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepo;
  AuthBloc({required this.authRepo}) : super(AuthInitial()) {
    on<AuthEventRegisterUser>(_register);

    on<AuthEventLoginUser>(_login);
  }

  _register(event, emit) async {
    emit(AuthStateIsLoading());
    final response = await authRepo.registerUser(
      userName: event.userData.userName ?? "",
      email: event.userData.email ?? "",
      password: event.userData.password ?? "",
    );

    response.fold((l) => emit(AuthStateError(error: l)), (r) {
      emit(
        AuthStateUserIsRegistered(userData: event.userData, user: r),
      );
    });
  }

  _login(event, emit) async {
    emit(AuthStateIsLoading());
    final response = await authRepo.login(
      email: event.userData.email!,
      password: event.userData.password!,
    );

    response.fold((l) => emit(AuthStateError(error: l)), (r) {
      emit(
        AuthStateIsLoggedIn(userData: event.userData, user: r),
      );
    });
  }
}
