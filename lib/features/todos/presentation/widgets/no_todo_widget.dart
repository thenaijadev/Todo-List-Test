import 'package:flutter/material.dart';
import 'package:todo_list_test/core/widgets/text_widget.dart';

class NoTodoWidget extends StatelessWidget {
  const NoTodoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: TextWidget(text: "No Todo Items Here"),
    );
  }
}
