import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_test/app.dart';
import 'package:todo_list_test/core/utils/bloc_observer.dart';
import 'package:todo_list_test/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  appInitialization();

  Bloc.observer = AppBlocObserver();

  runApp(const MyApp());
}

appInitialization() async {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  setup();
}
