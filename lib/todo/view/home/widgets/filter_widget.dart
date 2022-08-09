import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

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
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 2.0)],
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
                  },
                  tag: _tag,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
