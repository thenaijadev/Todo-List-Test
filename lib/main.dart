import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_test/app.dart';
import 'package:todo_list_test/core/utils/bloc_observer.dart';
import 'package:todo_list_test/core/utils/logger.dart';
import 'package:todo_list_test/features/auth/data/providers/local_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  appInitialization();

  // await LocationServiceClass.determinePosition();

  Bloc.observer = AppBlocObserver();
  // final user = await LocalDataSource().getUser();

  runApp(const MyApp());
}

appInitialization() async {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}
