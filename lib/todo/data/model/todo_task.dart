import 'package:equatable/equatable.dart';

import 'enums/task_tag.dart';

class ToDoTask extends Equatable {
  final String title;
  final String? description;
  final TaskTag? tag;

  const ToDoTask({
    required this.title,
    required this.description,
    required this.tag,
  });

  static List<ToDoTask> getMockTasks() {
    return [
      const ToDoTask(
        title: 'Task 1',
        description: 'Description 1',
        tag: TaskTag.work,
      ),
      const ToDoTask(
        title: 'Task 2',
        description: 'Description 2',
        tag: TaskTag.mundane,
      ),
      const ToDoTask(
        title: 'Task 3',
        description: 'Description 3',
        tag: TaskTag.work,
      ),
      const ToDoTask(
        title: 'Task 4',
        description: 'Description 4',
        tag: TaskTag.study,
      ),
    ];
  }

  @override
  List<Object?> get props => [title, description, tag];
}
