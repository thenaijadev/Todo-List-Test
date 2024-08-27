import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_list_test/core/widgets/input_field_widget.dart';
import 'package:todo_list_test/core/widgets/primary_button.dart';
import 'package:todo_list_test/core/widgets/text_widget.dart';
import 'package:todo_list_test/features/todos/bloc/todos_bloc.dart';
import 'package:todo_list_test/features/todos/data/models/todo.dart';
import 'package:uuid/uuid.dart';

class CreateTodoBottomSheetWidget extends StatefulWidget {
  const CreateTodoBottomSheetWidget({super.key});

  @override
  State<CreateTodoBottomSheetWidget> createState() =>
      _CreateTodoBottomSheetWidgetState();
}

class _CreateTodoBottomSheetWidgetState
    extends State<CreateTodoBottomSheetWidget> {
  late GlobalKey<FormFieldState> titleKey;
  late GlobalKey<FormFieldState> detailsKey;

  @override
  void initState() {
    titleKey = GlobalKey<FormFieldState>();
    detailsKey = GlobalKey<FormFieldState>();
    super.initState();
  }

  String title = "";
  String subTitle = "";
  bool isValidTitle = true;

  bool isValidSubtitle = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: 20.0).copyWith(bottom: 20),
      child: SizedBox(
        height: MediaQuery.of(context).viewInsets.bottom == 0
            ? MediaQuery.of(context).size.height * .42
            : MediaQuery.of(context).size.height * .8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextWidget(
              text: "Add task",
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            SizedBox(
              height: 20.h,
            ),
            InputFieldWidget(
                hintColor: Theme.of(context).colorScheme.inversePrimary,
                hintText: "Title",
                hintSize: 12,
                key: titleKey,
                enabledBorderRadius: 10,
                onChanged: (val) {
                  setState(() {
                    title = val ?? "";
                    isValidTitle = title.trim() != "";
                  });
                }),
            if (!isValidTitle)
              const TextWidget(
                text: "Title field is required",
                fontSize: 12,
                color: Colors.red,
              ),
            SizedBox(
              height: 10.h,
            ),
            InputFieldWidget(
                hintColor: Theme.of(context).colorScheme.inversePrimary,
                hintText: "Details",
                hintSize: 12,
                key: detailsKey,
                maxLines: 3,
                enabledBorderRadius: 10,
                onChanged: (val) {
                  setState(() {
                    subTitle = val ?? "";
                    isValidSubtitle = subTitle.trim() != "";
                  });
                }),
            if (!isValidSubtitle)
              const TextWidget(
                text: "Details field is required",
                fontSize: 12,
                color: Colors.red,
              ),
            SizedBox(
              height: 10.h,
            ),
            const Spacer(),
            PrimaryButton(
                label: "Create task",
                onPressed: () {
                  if (title.trim() == "") {
                    setState(() {
                      isValidTitle = false;
                    });
                  } else if (subTitle.trim() == "") {
                    setState(() {
                      isValidSubtitle = false;
                    });
                  } else {
                    context.read<TodosBloc>().add(TodoEventCreateTodo(
                        todo: Todo(
                            id: const Uuid().v4(),
                            title: title,
                            subtitle: subTitle,
                            completed: false)));
                    Navigator.of(context).pop();
                  }
                },
                isEnabled: true),
          ],
        ),
      ),
    );
  }
}
