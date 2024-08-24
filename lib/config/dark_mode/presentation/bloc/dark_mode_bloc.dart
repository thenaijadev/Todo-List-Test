import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'dark_mode_event.dart';
part 'dark_mode_state.dart';

class DarkModeBloc extends Bloc<DarkModeEvent, DarkModeState> {
  DarkModeBloc() : super(const DarkModeCurrentState(status: "System")) {
    on<ToggleDarkModeEvent>((event, emit) {
      final String status = event.status;
      emit(DarkModeCurrentState(status: status));
    });
  }
}
