import 'package:flutter/material.dart';

class AddTaskButtonWidget extends StatelessWidget {
  const AddTaskButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      child: const Icon(Icons.add_rounded),
    );
  }
}