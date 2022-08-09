import 'package:flutter/material.dart';

import 'widgets/home_appbar_widget.dart';
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
      appBar: const HomeAppbarWidget(),
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
