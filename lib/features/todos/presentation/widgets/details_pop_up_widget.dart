import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_list_test/core/widgets/text_widget.dart';
import 'package:todo_list_test/core/widgets/white_popup.dart';
import 'package:todo_list_test/features/todos/bloc/todos_bloc.dart';

class DetailsPopupWidget extends StatelessWidget {
  const DetailsPopupWidget({
    super.key,
    required this.state,
    required this.index,
  });
  final TodoStateAllTodosRetrieved state;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
            border: Border.all(
                color: Theme.of(context).colorScheme.secondary, width: 0.2),
            color: Theme.of(context).colorScheme.background,
            borderRadius: BorderRadius.circular(5)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 140.w,
              child: TextWidget(
                  fontSize: 16, text: state.todos.data[index].title ?? ""),
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              width: 140.w,
              child: TextWidget(
                text: state.todos.data[index].subtitle ?? "",
                color: Theme.of(context).colorScheme.tertiary,
                fontWeight: FontWeight.w500,
                fontSize: 11.sp,
              ),
            ),
          ],
        ));
  }
}
