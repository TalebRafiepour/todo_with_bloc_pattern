import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_with_bloc_pattern/data/data.dart';
import 'package:todo_with_bloc_pattern/ui/edit/cubit/edittask_cubit.dart';

class EditTaskScreen extends StatefulWidget {
  const EditTaskScreen({Key? key}) : super(key: key);

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  late final TextEditingController _taskController;

  @override
  void initState() {
    _taskController = TextEditingController(
        text: context.read<EdittaskCubit>().state.task.name);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit task'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            context.read<EdittaskCubit>().onSaveChangeClick();
            Navigator.pop(context);
          },
          label: const Text('Save Changes')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            BlocBuilder<EdittaskCubit, EdittaskState>(
              builder: (context, state) {
                final priority = state.task.priority;
                return Flex(
                  direction: Axis.horizontal,
                  children: [
                    Flexible(
                        flex: 1,
                        child: PriorityCheckbox(
                          lable: 'High',
                          color: Colors.green,
                          isSelected: priority == Priority.high,
                          onTap: () {
                            context
                                .read<EdittaskCubit>()
                                .onPriorityChanged(Priority.high);
                          },
                        )),
                    const SizedBox(
                      width: 8,
                    ),
                    Flexible(
                        flex: 1,
                        child: PriorityCheckbox(
                            lable: 'Normal',
                            color: Colors.orange,
                            onTap: () {
                              context
                                  .read<EdittaskCubit>()
                                  .onPriorityChanged(Priority.normal);
                            },
                            isSelected: priority == Priority.normal)),
                    const SizedBox(
                      width: 8,
                    ),
                    Flexible(
                        flex: 1,
                        child: PriorityCheckbox(
                            onTap: () {
                              context
                                  .read<EdittaskCubit>()
                                  .onPriorityChanged(Priority.low);
                            },
                            lable: 'Low',
                            color: Colors.yellow,
                            isSelected: priority == Priority.low)),
                  ],
                );
              },
            ),
            TextField(
              controller: _taskController,
              onChanged: (value) {
                context.read<EdittaskCubit>().onTextChanged(value);
              },
              decoration: InputDecoration(
                  label: Text('Add a task ...',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!.apply(fontSizeFactor: 1.2))),
            )
          ],
        ),
      ),
    );
  }
}

class PriorityCheckbox extends StatelessWidget {
  final String lable;
  final Color color;
  final bool isSelected;
  final GestureTapCallback onTap;

  const PriorityCheckbox(
      {Key? key,
      required this.lable,
      required this.color,
      required this.isSelected,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 35,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(width: 2, color: Colors.black.withOpacity(0.2))),
        child: Stack(
          children: [
            Center(
              child: Text(lable),
            ),
            Positioned(
                right: 8,
                bottom: 0,
                top: 0,
                child: Center(
                  child: Priorityshape(
                    value: isSelected,
                    color: color,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

class Priorityshape extends StatelessWidget {
  final bool value;
  final Color color;
  const Priorityshape({Key? key, required this.value, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(12), color: color),
      child: value
          ? const Icon(
              CupertinoIcons.check_mark,
              color: Colors.white,
              size: 12,
            )
          : null,
    );
  }
}
