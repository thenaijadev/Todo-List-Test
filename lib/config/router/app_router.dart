import 'package:flutter/material.dart';
import 'package:todo_list_test/config/router/routes.dart';
import 'package:todo_list_test/core/widgets/error_screen.dart';
import 'package:todo_list_test/features/auth/presentation/screens/create_account_screen.dart';
import 'package:todo_list_test/features/auth/presentation/screens/login_screen.dart';
import 'package:todo_list_test/features/auth/presentation/screens/splash_screen.dart';
import 'package:todo_list_test/features/todos/presentation/screens/todo_list_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      // case Routes.onboardingScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => const OnboardingScreen(),
      //   );
      case Routes.signUp:
        return MaterialPageRoute(
          builder: (_) => const CreateAccountScreen(),
        );

      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case Routes.todoList:
        return MaterialPageRoute(
          builder: (_) => const TodoListScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const ErrorScreen(),
        );
    }
  }
}
