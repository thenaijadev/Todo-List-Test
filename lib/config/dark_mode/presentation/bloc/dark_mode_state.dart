// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'dark_mode_bloc.dart';

abstract class DarkModeState extends Equatable {
  const DarkModeState();

  @override
  List<Object> get props => [];
}

class DarkModeCurrentState extends DarkModeState {
  final String status;
  const DarkModeCurrentState({
    required this.status,
  });

  @override
  List<Object> get props => [status];
}

class DarkModeStateUseSystem extends DarkModeState {}
