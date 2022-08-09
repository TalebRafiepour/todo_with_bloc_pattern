import 'package:flutter/material.dart';

import '../../data/model/todo_task.dart';
import 'task_item_widget.dart';

class TaskListViewWidget extends StatelessWidget {
  const TaskListViewWidget({
    Key? key,
    required this.tasks,
  }) : super(key: key);

  final List<ToDoTask> tasks;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return TaskItemWidget(task: tasks[index]);
      },
    );
  }
}
