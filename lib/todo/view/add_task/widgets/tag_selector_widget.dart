import 'package:flutter/material.dart';

import '../../../data/model/enums/task_tag.dart';


class TagSelectorWidget extends StatefulWidget {
  final Function(TaskTag?)? onChanged;
  final TaskTag? _tag;

  const TagSelectorWidget({
    required this.onChanged,
    required TaskTag? tag,
    Key? key,
  })  : _tag = tag,
        super(key: key);

  @override
  State<TagSelectorWidget> createState() => _TagSelectorWidgetState();
}

class _TagSelectorWidgetState extends State<TagSelectorWidget> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<TaskTag>(
      value: widget._tag,
      items: TaskTag.values
          .map((e) => DropdownMenuItem(
                child: Text(e.name),
                value: e,
              ))
          .toList(),
      isExpanded: true,
      itemHeight: 70,
      hint: const Text('Select Tag'),
      onChanged: widget.onChanged,
    );
  }
}