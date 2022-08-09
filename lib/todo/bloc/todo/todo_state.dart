import 'dart:convert';

import '../../data/model/todo_task.dart';

class TodoState {
  List<ToDoTask> tasks;

  TodoState({
    required this.tasks,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tasks': tasks.map((x) => x.toMap()).toList(),
    };
  }

  factory TodoState.fromMap(Map<String, dynamic> map) {
    return TodoState(
      tasks: List<ToDoTask>.from(
        (map['tasks'] as List<dynamic>).map<ToDoTask>(
          (x) => ToDoTask.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory TodoState.fromJson(String source) =>
      TodoState.fromMap(json.decode(source) as Map<String, dynamic>);

  TodoState copyWith({
    List<ToDoTask>? tasks,
  }) {
    return TodoState(
      tasks: tasks ?? this.tasks,
    );
  }

  @override
  String toString() => 'TodoState(tasks: $tasks)';
}