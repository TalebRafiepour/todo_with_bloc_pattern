import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../foundation/mixins/validator_mixin.dart';
import '../../bloc/todo/todo_bloc.dart';
import '../../data/model/enums/task_tag.dart';
import '../../data/model/todo_task.dart';
import '../widgets/tag_selector_widget.dart';
import '../widgets/todo_appbar_widget.dart';

class EditTaskScreen extends StatefulWidget {
  final ToDoTask task;
  const EditTaskScreen({required this.task, Key? key}) : super(key: key);

  @override
  State<EditTaskScreen> createState() => EditTaskScreenState();
}

class EditTaskScreenState extends State<EditTaskScreen> with ValidatorMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FocusScopeNode _node = FocusScopeNode();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  TaskTag? _tag;

  @override
  void initState() {
    _tag = widget.task.tag;
    _titleController.text = widget.task.title;
    _descriptionController.text = widget.task.description ?? '';
    super.initState();
  }

  void _editTask() {
    if (_formKey.currentState!.validate()) {
      ToDoTask _newTask = ToDoTask(
        title: _titleController.text,
        description: _descriptionController.text,
        tag: _tag,
        time: widget.task.time, // Time shouldn't change!
      );
      context
          .read<TodoBloc>()
          .add(EditTaskEvent(oldTask: widget.task, newTask: _newTask));
      Navigator.pop(context);
    }
  }

  void _removeTask() {
    if (_formKey.currentState!.validate()) {
      context.read<TodoBloc>().add(RemoveTaskEvent(task: widget.task));
      Navigator.pop(context);
    }
  }

  void _markAsDone() {
    context.read<TodoBloc>().add(MarkTaskEvent(task: widget.task));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ToDoAppBarWidget(title: 'Edit Task'),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FocusScope(
          node: _node,
          child: Form(
              key: _formKey,
              child: Column(children: [
                TextFormField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    hintText: 'Buy Groceries',
                    label: Text('Title'),
                  ),
                  validator: taskTitleValidator,
                  textInputAction: TextInputAction.next,
                  onEditingComplete: () {
                    _node.nextFocus();
                  },
                ),
                const Gap(10.0),
                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                    hintText: 'Buy eggs, milk, etc.',
                    label: Text('Description'),
                  ),
                  textInputAction: TextInputAction.done,
                  onEditingComplete: () {
                    _node.unfocus();
                  },
                ),
                const Gap(10.0),
                TagSelectorWidget(
                  tag: _tag,
                  onChanged: (tag) {
                    setState(() {
                      _tag = tag;
                    });
                  },
                ),
                const Spacer(),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: ElevatedButton(
                        onPressed: _removeTask,
                        child: const Text(
                          'Remove Task',
                          textAlign: TextAlign.center,
                        ),
                        style: ElevatedButton.styleFrom(primary: Colors.red),
                      ),
                    ),
                    const Gap(20.0),
                    Expanded(
                      flex: 1,
                      child: ElevatedButton(
                          onPressed: _editTask,
                          child: const Text(
                            'Edit Task',
                            textAlign: TextAlign.center,
                          )),
                    ),
                    const Gap(20.0),
                    Expanded(
                      flex: 1,
                      child: ElevatedButton(
                          onPressed: _markAsDone,
                          child: Text(
                            widget.task.isDone
                                ? 'Mark as Undone!'
                                : 'Mark as Done!',
                            textAlign: TextAlign.center,
                          )),
                    ),
                  ],
                )
              ])),
        ),
      ),
    );
  }
}
