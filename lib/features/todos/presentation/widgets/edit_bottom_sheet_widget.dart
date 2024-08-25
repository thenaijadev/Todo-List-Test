import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_list_test/core/widgets/input_field_widget.dart';
import 'package:todo_list_test/core/widgets/primary_button.dart';
import 'package:todo_list_test/core/widgets/text_widget.dart';

class EditTodoBottomSheetWidget extends StatefulWidget {
  const EditTodoBottomSheetWidget({super.key});

  @override
  State<EditTodoBottomSheetWidget> createState() =>
      _EditTodoBottomSheetWidgetState();
}

class _EditTodoBottomSheetWidgetState extends State<EditTodoBottomSheetWidget> {
  late GlobalKey<FormFieldState> titleKey = GlobalKey<FormFieldState>();
  late GlobalKey<FormFieldState> detailsKey = GlobalKey<FormFieldState>();

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
              text: "Edit task",
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
                onChanged: (val) {}),
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
                onChanged: (val) {}),
            SizedBox(
              height: 10.h,
            ),
            const Spacer(),
            PrimaryButton(
                label: "Edit task",
                onPressed: () {
                  // Navigator.pushNamed(context, Routes.createAccount);
                },
                isEnabled: true),
          ],
        ),
      ),
    );
  }
}
