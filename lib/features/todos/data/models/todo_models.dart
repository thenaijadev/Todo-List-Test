class TodosModel {
  TodosModel({
    required this.status,
    required this.code,
    required this.data,
  });

  final String? status;
  final int? code;
  final List<Datum> data;

  factory TodosModel.fromJson(Map<String, dynamic> json) {
    return TodosModel(
      status: json["status"],
      code: json["code"],
      data: json["data"] == null
          ? []
          : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "data": data.map((x) => x.toJson()).toList(),
      };
}

class Datum {
  Datum({
    required this.title,
    required this.subtitle,
    required this.completed,
  });

  final String? title;
  final String? subtitle;
  final bool? completed;

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      title: json["title"],
      subtitle: json["subtitle"],
      completed: json["completed"],
    );
  }

  Map<String, dynamic> toJson() => {
        "title": title,
        "subtitle": subtitle,
        "completed": completed,
      };
}
