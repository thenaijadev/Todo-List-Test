import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_test/core/utils/logger.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);

    if (bloc is Cubit) {
      logger.i("This is a Cubit");
    } else {
      logger.i("This is a Bloc");
    }
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    logger.i("an event Happened in $bloc the event is $event");
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);

    logger.i(
        "There was a transition from ${transition.currentState} to ${transition.nextState}");
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    logger.i(
        "Error happened in $bloc with error $error and the stacktrace is $stackTrace");
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    logger.i("BLOC is closed");
  }
}
