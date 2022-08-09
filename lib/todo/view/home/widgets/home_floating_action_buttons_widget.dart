import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'add_task_button.dart';
import 'remove_all_button_widget.dart';

class HomeFloatingActionButtonsWidget extends StatelessWidget {
  const HomeFloatingActionButtonsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: const [
        RemoveAllButtonWidget(), // For test purposes only.
        Gap(20.0),
        AddTaskButtonWidget(),
      ],
    );
  }
}
