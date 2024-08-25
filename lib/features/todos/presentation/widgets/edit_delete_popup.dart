import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_list_test/core/widgets/snackbar.dart';
import 'package:todo_list_test/core/widgets/text_widget.dart';
import 'package:todo_list_test/features/todos/bloc/todos_bloc.dart';
import 'package:todo_list_test/features/todos/data/models/todo.dart';
import 'package:todo_list_test/features/todos/presentation/widgets/edit_bottom_sheet_widget.dart';

class EditDeletePopUpWidget extends StatelessWidget {
  const EditDeletePopUpWidget({
    super.key,
    required this.todo,
  });
  final Todo todo;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 50),
      decoration: BoxDecoration(
          border: Border.all(
              color: Theme.of(context).colorScheme.secondary, width: 0.2),
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextWidget(
            text: "Edit task",
            onTap: () {
              Navigator.of(context).pop();
              showModalBottomSheet(
                  isScrollControlled: true,
                  scrollControlDisabledMaxHeightRatio: (1 / 2.5),
                  showDragHandle: true,
                  backgroundColor: Theme.of(context).colorScheme.background,
                  context: context,
                  builder: ((context) {
                    return EditTodoBottomSheetWidget(
                      todo: todo,
                    );
                  }));
            },
            fontSize: 16.sp,
          ),
          SizedBox(
            height: 10.h,
          ),
          TextWidget(
            text: "Delete task",
            onTap: () {
              context.read<TodosBloc>().add(TodoEventDeleteTodo(todo: todo));
              Navigator.of(context).pop();
              InfoSnackBar.showErrorSnackBar(
                  context, "Task Item has been deleted");
            },
            fontSize: 16,
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}
