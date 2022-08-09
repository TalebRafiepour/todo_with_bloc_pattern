import 'package:flutter/material.dart';
import 'package:todo_with_bloc_pattern/todo/view/add_task/add_task_screen.dart';
import 'package:todo_with_bloc_pattern/todo/view/home/todo_home_screen.dart';

import '../todo/data/model/todo_task.dart';
import '../todo/view/edit_task/edit_task_screen.dart';
import 'constants/routes.dart';

class ToDoRouter {
  static Map<String, WidgetBuilder> routes = {
    ToDoRoutes.todoHomeScreen: (contex) => const ToDoHomeScreen(),
    ToDoRoutes.addTaskScreen: (context) => const AddTaskScreen(),
    ToDoRoutes.editTaskScreen: (context) => EditTaskScreen(
        task: ModalRoute.of(context)!.settings.arguments as ToDoTask),
  };
}
