import 'package:flutter/material.dart';

class ToDoAppBarWidget extends StatelessWidget with PreferredSizeWidget {
  final String title;
  const ToDoAppBarWidget({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
