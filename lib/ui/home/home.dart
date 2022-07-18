import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:todo_with_bloc_pattern/data/data.dart';
import 'package:todo_with_bloc_pattern/data/repo/repository.dart';
import 'package:todo_with_bloc_pattern/ui/edit/cubit/edittask_cubit.dart';
import 'package:todo_with_bloc_pattern/ui/edit/edit.dart';
import 'package:todo_with_bloc_pattern/ui/home/bloc/tasklist_bloc.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController searchconroller = TextEditingController();

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: ((context) => BlocProvider<EdittaskCubit>(
                      create: (context) => EdittaskCubit(
                          Task(), context.read<Repository<Task>>()),
                      child: const EditTaskScreen(),
                    ))));
          },
          label: const Text('Add New Task')),
      body: BlocProvider<TasklistBloc>(
        create: (context) => TasklistBloc(context.read<Repository<Task>>()),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                height: 110,
                color: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Text('ToDo List',
                          style: themeData.textTheme.headline6!.apply(
                            color: themeData.colorScheme.onPrimary,
                          )),
                      const SizedBox(
                        height: 16,
                      ),
                      Container(
                        height: 38,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: themeData.colorScheme.onPrimary,
                        ),
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Builder(
                              builder: (context) {
                                return TextField(
                                  onChanged: (value) {
                                    context
                                        .read<TasklistBloc>()
                                        .add(TaskListSearch(value));
                                  },
                                  controller: searchconroller,
                                  decoration: const InputDecoration(
                                      prefixIcon: Icon(CupertinoIcons.search),
                                      label: Text('Search tasks...')),
                                );
                              },
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(child: Consumer<Repository<Task>>(
                builder: (context, value, child) {
                  context.read<TasklistBloc>().add(TaskListStarted());
                  return BlocBuilder<TasklistBloc, TasklistState>(
                    builder: (context, state) {
                      if (state is TaskListSuccess) {
                        return Tasklist(
                            items: state.items, themeData: themeData);
                      } else if (state is TaskListLoading ||
                          state is TasklistInitial) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is TaskListError) {
                        return Center(
                          child: Text(state.errorMessage),
                        );
                      } else {
                        throw Exception('state is not valid');
                      }
                    },
                  );
                },
              )),
            ],
          ),
        ),
      ),
    );
  }
}

class Tasklist extends StatelessWidget {
  const Tasklist({
    Key? key,
    required this.items,
    required this.themeData,
  }) : super(key: key);

  final List<Task> items;
  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final task = items[index];
          return TaskItem(task: task);
        });
  }
}

class TaskItem extends StatefulWidget {
  static const double height = 70;
  static const double borderRadius = 8;
  const TaskItem({
    Key? key,
    required this.task,
  }) : super(key: key);

  final Task task;

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final priorityColor;
    switch (widget.task.priority) {
      case Priority.low:
        priorityColor = Colors.yellow;
        break;
      case Priority.normal:
        priorityColor = Colors.orange;
        break;
      case Priority.high:
        priorityColor = Colors.green;
        break;
    }

    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => BlocProvider<EdittaskCubit>(
                create: (context) => EdittaskCubit(
                    widget.task, context.read<Repository<Task>>()),
                child: const EditTaskScreen())));
      },
      child: Container(
        margin: const EdgeInsets.only(top: 8),
        padding: const EdgeInsets.only(left: 16),
        height: TaskItem.height,
        decoration: BoxDecoration(
          color: themeData.colorScheme.surface,
          borderRadius: BorderRadius.circular(TaskItem.borderRadius),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                widget.task.name,
                style: const  TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 15,
                    ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Container(
              width: 5,
              height: TaskItem.height,
              decoration: BoxDecoration(
                  color: priorityColor,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(TaskItem.borderRadius),
                      bottomRight: Radius.circular(TaskItem.borderRadius))),
            )
          ],
        ),
      ),
    );
  }
}
