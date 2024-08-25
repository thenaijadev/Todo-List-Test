import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_list_test/core/widgets/loading_widget.dart';
import 'package:todo_list_test/core/widgets/snackbar.dart';
import 'package:todo_list_test/core/widgets/text_widget.dart';
import 'package:todo_list_test/core/widgets/white_popup.dart';
import 'package:todo_list_test/features/todos/bloc/todos_bloc.dart';
import 'package:todo_list_test/features/todos/presentation/widgets/create_todo_form_bottom_sheet.dart';
import 'package:todo_list_test/features/todos/presentation/widgets/details_pop_up_widget.dart';
import 'package:todo_list_test/features/todos/presentation/widgets/edit_delete_popup.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  @override
  void initState() {
    context.read<TodosBloc>().add(TodoEventGetTodos());
    super.initState();
  }

  bool isCompleted = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: const SizedBox(),
        backgroundColor: Theme.of(context).colorScheme.background,
        centerTitle: true,
        title: BlocBuilder<TodosBloc, TodosState>(
          builder: (context, state) {
            return Column(
              children: [
                TextWidget(
                  text:
                      "Tasks (${state is TodoStateAllTodosRetrieved ? state.todos.data.length : "--"})",
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                TextWidget(
                  text:
                      "Completed: ${state is TodoStateAllTodosRetrieved ? state.todos.data.where((element) => element.completed == true).length : "--"}",
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ],
            );
          },
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
        child: BlocConsumer<TodosBloc, TodosState>(
          listener: (context, state) {
            if (state is TodosStateError) {
              InfoSnackBar.showErrorSnackBar(
                  context, "There has been an error");
            }
          },
          builder: (context, state) {
            return state is TodoStateIsLoading
                ? const LoadingWidget()
                : state is TodosStateError
                    ? Center(
                        child: Column(
                          children: [
                            const TextWidget(text: "There has been an error"),
                            TextWidget(
                              onTap: () {
                                context
                                    .read<TodosBloc>()
                                    .add(TodoEventGetTodos());
                              },
                              text: "Retry",
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                      )
                    : state is TodoStateAllTodosRetrieved
                        ? ListView(
                            children:
                                List.generate(state.todos.data.length, (index) {
                              return GestureDetector(
                                onTap: () {
                                  showPopup(
                                      context: context,
                                      widget: EditDeletePopUpWidget(
                                          todo: state.todos.data[index]));
                                },
                                onLongPress: () {},
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.only(bottom: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          width: 0.2,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary),
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 120.w,
                                            child: TextWidget(
                                              onLongPress: () {
                                                showPopup(
                                                    context: context,
                                                    widget: DetailsPopupWidget(
                                                      state: state,
                                                      index: index,
                                                    ));
                                              },
                                              text: state.todos.data[index]
                                                      .title ??
                                                  "",
                                              overflow: TextOverflow.ellipsis,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14.sp,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 140.w,
                                            child: TextWidget(
                                              text: state.todos.data[index]
                                                      .subtitle ??
                                                  "",
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .tertiary,
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
                                              value: state.todos.data[index]
                                                      .completed ??
                                                  false,
                                              trackColor:
                                                  MaterialStatePropertyAll(
                                                      Theme.of(context)
                                                          .colorScheme
                                                          .background),
                                              inactiveThumbColor:
                                                  Theme.of(context)
                                                      .colorScheme
                                                      .tertiary,
                                              activeColor: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                              trackOutlineWidth:
                                                  const MaterialStatePropertyAll(
                                                      2),
                                              trackOutlineColor:
                                                  MaterialStatePropertyAll(
                                                      Theme.of(context)
                                                          .colorScheme
                                                          .inverseSurface),
                                              onChanged: (val) {
                                                context.read<TodosBloc>().add(
                                                      TodoEventUpdateTodo(
                                                        todo: state
                                                            .todos.data[index]
                                                            .copyWith(
                                                          completed: !state
                                                              .todos
                                                              .data[index]
                                                              .completed!,
                                                        ),
                                                      ),
                                                    );
                                              },
                                            ),
                                          ),
                                          TextWidget(
                                            text: state.todos.data[index]
                                                        .completed ??
                                                    false
                                                ? "Completed"
                                                : "Uncompleted",
                                            color: state.todos.data[index]
                                                        .completed ??
                                                    false
                                                ? Theme.of(context)
                                                    .colorScheme
                                                    .primary
                                                : Theme.of(context)
                                                    .colorScheme
                                                    .tertiary,
                                            fontSize: 12.sp,
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                          )
                        : const SizedBox();
          },
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

void showPopup({required BuildContext context, required Widget widget}) {
  showDialog(
    context: context,
    builder: (BuildContext context) => WhitePopup(
      child: widget,
    ),
  );
}
