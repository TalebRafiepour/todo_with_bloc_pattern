import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/todo/todo_bloc.dart';
import '../../../bloc/todo/todo_state.dart';
import '../../../data/model/todo_task.dart';
import 'task_item_widget.dart';

class TaskListViewWidget extends StatelessWidget {
  const TaskListViewWidget({
    Key? key,
    required this.tasks,
  }) : super(key: key);

  final List<ToDoTask> tasks;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(builder: (context, state) {
      return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: state.tasks.length,
          itemBuilder: (context, index) {
            return TaskItemWidget(task: state.tasks[index]);
          });
    });
  }
}
