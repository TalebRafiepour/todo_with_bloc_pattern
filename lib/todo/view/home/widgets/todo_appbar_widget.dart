import 'package:flutter/material.dart';

class ToDoAppBarWidget extends StatelessWidget with PreferredSizeWidget {
  const ToDoAppBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('ToDo App'),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}