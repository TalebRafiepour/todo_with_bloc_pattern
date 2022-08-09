import 'package:flutter/material.dart';
import 'package:todo_with_bloc_pattern/foundation/constants/routes.dart';

class AddTaskButtonWidget extends StatelessWidget {
  const AddTaskButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _addTaskMethod() {
      Navigator.pushNamed(context, ToDoRoutes.addTaskScreen);
    }

    return FloatingActionButton(
      onPressed: _addTaskMethod,
      heroTag: "btn1",
      child: const Icon(Icons.add_rounded),
    );
  }
}
