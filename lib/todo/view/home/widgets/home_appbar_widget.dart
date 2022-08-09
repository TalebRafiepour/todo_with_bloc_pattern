import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/todo/todo_bloc.dart';
import '../../../bloc/todo/todo_state.dart';
import '../../widgets/todo_appbar_widget.dart';

class HomeAppbarWidget extends StatelessWidget with PreferredSizeWidget {
  const HomeAppbarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        int _remainingTasksCount = state.tasks
            .where((element) => element.isDone == false)
            .toList()
            .length;
        return ToDoAppBarWidget(
            title: 'ToDo App ($_remainingTasksCount pending!)');
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
