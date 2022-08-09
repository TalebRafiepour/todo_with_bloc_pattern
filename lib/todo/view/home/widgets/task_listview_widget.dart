import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_with_bloc_pattern/todo/view/home/widgets/filter_widget.dart';

import '../../../bloc/todo/todo_bloc.dart';
import '../../../bloc/todo/todo_state.dart';
import 'no_task_indicator_widget.dart';
import 'task_item_widget.dart';

class TaskListViewWidget extends StatelessWidget {
  const TaskListViewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        if (state.tasks.isEmpty) {
          return const NoTaskIndicatorWidget();
        }
        return Column(
          children: [
            const FilterWidget(),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.filteredTasks != null
                    ? state.filteredTasks!.length
                    : state.tasks.length,
                itemBuilder: (context, index) {
                  return TaskItemWidget(
                      task: state.filteredTasks != null
                          ? state.filteredTasks![index]
                          : state.tasks[index]);
                }),
          ],
        );
      },
    );
  }
}
