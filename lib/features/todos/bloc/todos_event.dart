// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'todos_bloc.dart';

sealed class TodosEvent extends Equatable {
  const TodosEvent();

  @override
  List<Object> get props => [];
}

class TodoEventGetTodos extends TodosEvent {}

class TodoEventCreateTodo extends TodosEvent {
  final Todo todo;
  const TodoEventCreateTodo({
    required this.todo,
  });

  @override
  String toString() => 'TodoEventCreateTodo(todo: $todo)';
}

class TodoEventUpdateTodo extends TodosEvent {
  final Todo todo;
  const TodoEventUpdateTodo({
    required this.todo,
  });

  @override
  String toString() => 'TodoEventCreateTodo(todo: $todo)';
}

class TodoEventDeleteTodo extends TodosEvent {
  final Todo todo;
  const TodoEventDeleteTodo({
    required this.todo,
  });

  @override
  String toString() => 'TodoEventCreateTodo(todo: $todo)';
}
