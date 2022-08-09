import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:todo_with_bloc_pattern/todo/bloc/todo/todo_bloc.dart';
import 'package:todo_with_bloc_pattern/todo/data/model/filter_options.dart';

import '../../../bloc/todo/todo_state.dart';
import '../../../data/model/enums/task_tag.dart';
import '../../widgets/tag_selector_widget.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  bool _justShowDone = false;
  TaskTag? _tag;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              boxShadow: [
                BoxShadow(color: Colors.grey.shade300, blurRadius: 2.0)
              ],
              borderRadius: BorderRadius.circular(10.0)),
          padding: const EdgeInsets.all(20.0),
          margin: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              CheckboxListTile(
                  value: _justShowDone,
                  onChanged: (value) {
                    setState(() {
                      _justShowDone = value!;
                    });
                    debugPrint(state.options.toString());
                    if (state.options != null) {
                      context.read<TodoBloc>().add(FilterTasksEvent(
                          options: state.options!.copyWith(isDone: value)));
                    } else {
                      context.read<TodoBloc>().add(FilterTasksEvent(
                          options: FilterOptions(isDone: value, tag: null)));
                    }
                  },
                  title: const Text('Just Show Done!')),
              const Gap(10.0),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _tag = null;
                          _justShowDone = false;
                        });
                        context.read<TodoBloc>().add(RemoveFiltersEvent());
                      },
                      child: const SizedBox(
                        height: 50,
                        child: Center(
                          child: Text(
                            'Remove Filters',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Gap(20.0),
                  Expanded(
                    flex: 2,
                    child: TagSelectorWidget(
                      onChanged: (tag) {
                        setState(() {
                          _tag = tag;
                        });
                        debugPrint(state.options.toString());
                        if (state.options != null) {
                          context.read<TodoBloc>().add(FilterTasksEvent(
                              options: state.options!.copyWith(tag: _tag)));
                        } else {
                          context.read<TodoBloc>().add(FilterTasksEvent(
                              options:
                                  FilterOptions(isDone: false, tag: _tag)));
                        }
                      },
                      tag: _tag,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
