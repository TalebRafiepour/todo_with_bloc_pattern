import 'dart:convert';

import '../../data/model/filter_options.dart';
import '../../data/model/todo_task.dart';

class TodoState {
  List<ToDoTask> tasks;
  List<ToDoTask>? filteredTasks;
  FilterOptions? options;

  TodoState({
    required this.tasks,
    this.filteredTasks,
    this.options,
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
    List<ToDoTask>? filteredTasks,
    FilterOptions? options,
  }) {
    return TodoState(
      tasks: tasks ?? this.tasks,
      filteredTasks: filteredTasks ?? this.filteredTasks,
      options: options ?? this.options,
    );
  }

  TodoState copyWithThatMakesFilteredResultsNull({
    List<ToDoTask>? tasks,
    FilterOptions? options,
  }) {
    return TodoState(
      tasks: tasks ?? this.tasks,
      filteredTasks: null,
      options: options ?? this.options,
    );
  }

  @override
  String toString() =>
      'TodoState(tasks: $tasks, filteredTasks: $filteredTasks)';
}
