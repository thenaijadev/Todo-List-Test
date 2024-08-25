// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:todo_list_test/features/todos/data/models/todo.dart';

class TodosModel {
  TodosModel({
    required this.status,
    required this.code,
    required this.data,
  });

  final String? status;
  final int? code;
  final List<Todo> data;

  factory TodosModel.fromJson(Map<String, dynamic> json) {
    return TodosModel(
      status: json["status"],
      code: json["code"],
      data: json["data"] == null
          ? []
          : List<Todo>.from(json["data"]!.map((x) => Todo.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "data": data.map((x) => x.toJson()).toList(),
      };
}
