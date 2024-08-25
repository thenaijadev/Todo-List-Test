import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_list_test/config/dark_mode/presentation/bloc/dark_mode_bloc.dart';
import 'package:todo_list_test/config/router/app_router.dart';
import 'package:todo_list_test/config/router/routes.dart';
import 'package:todo_list_test/config/theme/dark_theme.dart';
import 'package:todo_list_test/core/utils/app_constraints.dart';
import 'package:todo_list_test/features/auth/bloc/auth_bloc.dart';
import 'package:todo_list_test/features/auth/data/providers/auth_provider.dart';
import 'package:todo_list_test/features/auth/data/providers/local_provider.dart';
import 'package:todo_list_test/features/auth/data/repositories/auth_repo.dart';
import 'package:todo_list_test/features/todos/bloc/todos_bloc.dart';
import 'package:todo_list_test/features/todos/data/providers/todo_provider.dart';
import 'package:todo_list_test/features/todos/data/repositories/todo_repositories.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    AppConstraints().initialize(context);

    final appRouter = AppRouter();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DarkModeBloc(),
        ),
        BlocProvider(
          create: (context) => AuthBloc(
            authRepo: AuthRepository(
              provider: AuthProvider(),
              localDataSource: AuthUserLocalDataSourceImpl(),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => TodosBloc(
            todosRepostory: TodoRepository(
              provider: TodoProvider(),
            ),
          ),
        ),
      ],
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              theme: darkTheme(),
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              initialRoute: Routes.splash,
              onGenerateRoute: appRouter.onGenerateRoute,
            );
          },
        ),
      ),
    );
  }
}
