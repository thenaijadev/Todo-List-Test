import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_test/core/widgets/text_widget.dart';
import 'package:todo_list_test/features/auth/data/providers/local_provider.dart';
import 'package:todo_list_test/features/auth/presentation/screens/login_screen.dart';
import 'package:todo_list_test/features/todos/presentation/screens/todo_list_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: AuthUserLocalDataSourceImpl().getUser(),
        builder: (context, snapShot) {
          return AnimatedSplashScreen(
              backgroundColor: Theme.of(context).colorScheme.background,
              splash: const TextWidget(
                text: "Task Manager",
                fontSize: 24,
              ),
              nextScreen: snapShot.hasData
                  ? const TodoListScreen()
                  : const LoginScreen());
        });
  }
}
