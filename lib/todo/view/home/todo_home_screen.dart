import 'package:flutter/material.dart';

import '../widgets/todo_appbar_widget.dart';
import 'widgets/home_floating_action_buttons_widget.dart';
import 'widgets/task_listview_widget.dart';

class ToDoHomeScreen extends StatefulWidget {
  const ToDoHomeScreen({Key? key}) : super(key: key);

  @override
  State<ToDoHomeScreen> createState() => _ToDoHomeScreenState();
}

class _ToDoHomeScreenState extends State<ToDoHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ToDoAppBarWidget(title: 'ToDo App'),
      floatingActionButton: const HomeFloatingActionButtonsWidget(),
      body: SingleChildScrollView(
          child: Column(
        children: const [
          TaskListViewWidget(),
        ],
      )),
    );
  }
}
