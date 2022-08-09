import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../data/model/todo_task.dart';

class TaskItemWidget extends StatelessWidget {
  const TaskItemWidget({
    Key? key,
    required this.task,
  }) : super(key: key);

  final ToDoTask task;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 2.0)],
          borderRadius: BorderRadius.circular(10.0)),
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              task.title,
              style: Theme.of(context).textTheme.headline6,
            ),
            const Gap(10.0),
            Text(
              task.description ?? '',
              style: const TextStyle(color: Colors.grey),
            ),
            const Gap(10.0),
            Text(
              task.tag?.name ?? '',
              style: const TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}