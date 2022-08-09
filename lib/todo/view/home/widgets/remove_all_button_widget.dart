import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/todo/todo_bloc.dart';
import '../../../bloc/todo/todo_state.dart';

class RemoveAllButtonWidget extends StatelessWidget {
  const RemoveAllButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        // When we don't have any task, we don't need to see this button.
        if (state.tasks.isEmpty) {
          return const SizedBox(height: 0);
        }
        return FloatingActionButton(
          onPressed: () {
            context.read<TodoBloc>().add(RemoveAllTasksEvent());
          },
          child: const Icon(Icons.cleaning_services_rounded),
          mini: true,
          heroTag: "btn2",
          backgroundColor: Colors.red,
        );
      },
    );
  }
}
