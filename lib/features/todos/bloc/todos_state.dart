// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'todos_bloc.dart';

sealed class TodosState extends Equatable {
  const TodosState();

  @override
  List<Object> get props => [];
}

final class TodosInitial extends TodosState {}

class TodoStateIsLoading extends TodosState {}

class TodoStateAllTodosRetrieved extends TodosState {
  final TodosModel todos;
  const TodoStateAllTodosRetrieved({
    required this.todos,
  });
  @override
  List<Object> get props => [todos];
}

class TodosStateError extends TodosState {
  final TodoError error;
  const TodosStateError({
    required this.error,
  });
}
