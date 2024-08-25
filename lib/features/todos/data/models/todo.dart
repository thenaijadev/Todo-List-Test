class Todo {
  Todo({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.completed,
  });

  final String id;
  final String? title;
  final String? subtitle;
  final bool? completed;

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json["id"],
      title: json["title"],
      subtitle: json["subtitle"],
      completed: json["completed"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "subtitle": subtitle,
        "completed": completed,
      };

  @override
  String toString() =>
      'Todo(id: $id, title: $title, subtitle: $subtitle, completed: $completed)';

  Todo copyWith({
    String? id,
    String? title,
    String? subtitle,
    bool? completed,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      completed: completed ?? this.completed,
    );
  }
}
