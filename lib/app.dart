import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_list_test/config/router/app_router.dart';
import 'package:todo_list_test/config/router/routes.dart';
import 'package:todo_list_test/config/theme/dark_theme.dart';

import 'package:todo_list_test/features/auth/bloc/auth_bloc.dart';
import 'package:todo_list_test/features/todos/bloc/todos_bloc.dart';
import 'package:todo_list_test/service_locator.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(authRepo: getIt()),
        ),
        BlocProvider(
          create: (context) => TodosBloc(todosRepostory: getIt()),
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
