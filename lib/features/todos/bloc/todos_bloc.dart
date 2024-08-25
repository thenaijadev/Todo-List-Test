import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_list_test/features/todos/data/models/todo.dart';
import 'package:todo_list_test/features/todos/data/models/todo_error.dart';
import 'package:todo_list_test/features/todos/data/models/todo_models.dart';
import 'package:todo_list_test/features/todos/data/providers/local_todo_list_provider.dart';
import 'package:todo_list_test/features/todos/data/repositories/todo_repositories.dart';

part 'todos_event.dart';
part 'todos_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  final TodoRepository todosRepostory;
  TodosBloc({required this.todosRepostory}) : super(TodosInitial()) {
    on<TodoEventGetTodos>((event, emit) async {
      emit(TodoStateIsLoading());
      if (await LocalTodoListProvider().getTodos() != null) {
        final todos = await LocalTodoListProvider().getTodos();
        emit(TodoStateAllTodosRetrieved(todos: todos!));
      } else {
        final response = await todosRepostory.getTodos();

        var todos = await LocalTodoListProvider().getTodos();

        response.fold((l) => emit(TodosStateError(error: l)),
            (r) => emit(TodoStateAllTodosRetrieved(todos: todos!)));
      }
    });

    on<TodoEventCreateTodo>((event, emit) async {
      emit(TodoStateIsLoading());

      final response = await todosRepostory.createTodo(
          title: event.todo.title ?? "",
          subtitle: event.todo.subtitle ?? "",
          isCompleted: event.todo.completed ?? false);

      response.fold((l) => emit(TodosStateError(error: l)),
          (r) => emit(TodoStateAllTodosRetrieved(todos: r)));
    });

    on<TodoEventUpdateTodo>((event, emit) async {
      emit(TodoStateIsLoading());
      final res = await todosRepostory.updateTodo(todo: event.todo);
      res.fold((l) => emit(TodosStateError(error: l)),
          (r) => emit(TodoStateAllTodosRetrieved(todos: r)));
    });

    on<TodoEventDeleteTodo>((event, emit) async {
      emit(TodoStateIsLoading());
      final res = await todosRepostory.deleteTodo(todo: event.todo);
      res.fold((l) => emit(TodosStateError(error: l)),
          (r) => emit(TodoStateAllTodosRetrieved(todos: r)));
    });
  }
}
