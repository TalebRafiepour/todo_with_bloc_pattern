import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:todo_with_bloc_pattern/foundation/mixins/validator_mixin.dart';

import '../../bloc/todo/todo_bloc.dart';
import '../../data/model/enums/task_tag.dart';
import '../../data/model/todo_task.dart';
import '../widgets/tag_selector_widget.dart';
import '../widgets/todo_appbar_widget.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> with ValidatorMixin {
  final _formKey = GlobalKey<FormState>();
  final _node = FocusScopeNode();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  TaskTag? _tag;

  void _addTask() {
    if (_formKey.currentState!.validate()) {
      ToDoTask _task = ToDoTask(
        title: _titleController.text,
        description: _descriptionController.text,
        tag: _tag,
        time: DateTime.now(),
      );
      context.read<TodoBloc>().add(AddTodoItemEvent(task: _task));
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ToDoAppBarWidget(title: 'Add Task'),
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
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: _addTask, child: const Text('Add Task')),
                )
              ])),
        ),
      ),
    );
  }
}
