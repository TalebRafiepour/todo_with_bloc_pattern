import 'package:flutter/material.dart';

import '../../data/model/todo_task.dart';
import '../widgets/todo_appbar_widget.dart';
import 'widgets/add_task_button.dart';
import 'widgets/task_listview_widget.dart';

class ToDoHomeScreen extends StatefulWidget {
  const ToDoHomeScreen({Key? key}) : super(key: key);

  @override
  State<ToDoHomeScreen> createState() => _ToDoHomeScreenState();
}

class _ToDoHomeScreenState extends State<ToDoHomeScreen> {
  List<ToDoTask> tasks = ToDoTask.getMockTasks();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ToDoAppBarWidget(title: 'ToDo App'),
      floatingActionButton: const AddTaskButtonWidget(),
      body: SingleChildScrollView(
          child: Column(
        children: [
          TaskListViewWidget(tasks: tasks),
        ],
      )),
    );
  }
}
