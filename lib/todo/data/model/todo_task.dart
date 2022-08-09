import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'enums/task_tag.dart';

class ToDoTask extends Equatable {
  final String title;
  final String? description;
  final TaskTag? tag;
  final bool isDone;
  final DateTime? time;

  const ToDoTask({
    required this.title,
    this.description,
    this.tag,
    this.isDone = false,
    this.time,
  });

  // static List<ToDoTask> getMockTasks() {
  //   return [
  //     const ToDoTask(
  //       title: 'Task 1',
  //       description: 'Description 1',
  //       tag: TaskTag.work,
  //     ),
  //     const ToDoTask(
  //       title: 'Task 2',
  //       description: 'Description 2',
  //       tag: TaskTag.mundane,
  //     ),
  //     const ToDoTask(
  //       title: 'Task 3',
  //       description: 'Description 3',
  //       tag: TaskTag.work,
  //     ),
  //     const ToDoTask(
  //       title: 'Task 4',
  //       description: 'Description 4',
  //       tag: TaskTag.study,
  //     ),
  //   ];
  // }

  @override
  List<Object?> get props => [title, description, tag, time];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'tag': tag?.toMap(),
      'isDone': isDone,
      'time': time?.millisecondsSinceEpoch,
    };
  }

  factory ToDoTask.fromMap(Map<String, dynamic> map) {
    return ToDoTask(
        title: map['title'] as String,
        description:
            map['description'] != null ? map['description'] as String : null,
        tag: map['tag'] != null ? enumFromMap(map['tag'] as String) : null,
        isDone: map['isDone'] as bool,
        time: map['time'] != null
            ? DateTime.fromMillisecondsSinceEpoch(map['time'] as int)
            : null);
  }

  String toJson() => json.encode(toMap());

  factory ToDoTask.fromJson(String source) =>
      ToDoTask.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ToDoTask(title: $title, description: $description, tag: $tag, isDone: $isDone, time: ${time.toString()})';
  }

  ToDoTask copyWith({
    String? title,
    String? description,
    TaskTag? tag,
    bool? isDone,
    DateTime? time,
  }) {
    return ToDoTask(
      title: title ?? this.title,
      description: description ?? this.description,
      tag: tag ?? this.tag,
      isDone: isDone ?? this.isDone,
      time: time ?? this.time,
    );
  }
}
