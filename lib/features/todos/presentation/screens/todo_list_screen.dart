import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_list_test/core/widgets/snackbar.dart';
import 'package:todo_list_test/core/widgets/text_widget.dart';
import 'package:todo_list_test/core/widgets/white_popup.dart';
import 'package:todo_list_test/features/todos/presentation/widgets/create_todo_form_bottom_sheet.dart';
import 'package:todo_list_test/features/todos/presentation/widgets/edit_bottom_sheet_widget.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  bool isCompleted = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: const SizedBox(),
        backgroundColor: Theme.of(context).colorScheme.background,
        centerTitle: true,
        title: TextWidget(
          text: "Tasks",
          fontSize: 22,
          fontWeight: FontWeight.w500,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
      body: Container(
        height: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          image: const DecorationImage(
            image: AssetImage("assets/images/splash_background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: [
            ...List.generate(40, (index) {
              return GestureDetector(
                onTap: () {
                  showWhitePopup(
                      context: context,
                      widget: Container(
                        padding: const EdgeInsets.symmetric(vertical: 50),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).colorScheme.secondary,
                                width: 0.2),
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
                                    scrollControlDisabledMaxHeightRatio:
                                        (1 / 2.5),
                                    showDragHandle: true,
                                    backgroundColor: Theme.of(context)
                                        .colorScheme
                                        .background,
                                    context: context,
                                    builder: ((context) {
                                      return const EditTodoBottomSheetWidget();
                                    }));
                              },
                              fontSize: 16,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextWidget(
                              text: "Delete task",
                              onTap: () {
                                Navigator.of(context).pop();
                                InfoSnackBar.showErrorSnackBar(
                                    context, "task Item has been deleted");
                              },
                              fontSize: 16,
                              color: Colors.red,
                            ),
                          ],
                        ),
                      ));
                },
                onLongPress: () {},
                child: Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          width: 0.2,
                          color: Theme.of(context).colorScheme.secondary),
                      color: Theme.of(context).colorScheme.background),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 100.w,
                            child: TextWidget(
                              text: "Buy Mddasdagaskdasgsilk",
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                            ),
                          ),
                          SizedBox(
                            width: 140.w,
                            child: TextWidget(
                              text:
                                  "Buy Mddasdagaskdasgadagsaadsdsgasdasdcdsfgfsdfarearsgsdfadssdgsdfasdsadfretgsdasfdgseqradfsilk",
                              color: Theme.of(context).colorScheme.tertiary,
                              fontWeight: FontWeight.w500,
                              fontSize: 11.sp,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Transform.scale(
                            scale: 0.6,
                            child: Switch(
                              value: isCompleted,
                              trackColor: MaterialStatePropertyAll(
                                  Theme.of(context).colorScheme.background),
                              inactiveThumbColor:
                                  Theme.of(context).colorScheme.primary,
                              activeColor:
                                  Theme.of(context).colorScheme.primary,
                              trackOutlineWidth:
                                  const MaterialStatePropertyAll(2),
                              trackOutlineColor: MaterialStatePropertyAll(
                                  Theme.of(context).colorScheme.inverseSurface),
                              onChanged: (val) {
                                setState(() {
                                  isCompleted = val;
                                });
                              },
                            ),
                          ),
                          TextWidget(
                            text: isCompleted ? "Completed" : "Uncompleted",
                            color: isCompleted
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context).colorScheme.tertiary,
                            fontSize: 12.sp,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
        ),
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              scrollControlDisabledMaxHeightRatio: (1 / 2.5),
              showDragHandle: true,
              backgroundColor: Theme.of(context).colorScheme.background,
              context: context,
              builder: ((context) {
                return const CreateTodoBottomSheetWidget();
              }));
        },
      ),
    );
  }
}

void showWhitePopup({required BuildContext context, required Widget widget}) {
  showDialog(
    context: context,
    builder: (BuildContext context) => WhitePopup(
      child: widget,
    ),
  );
}
