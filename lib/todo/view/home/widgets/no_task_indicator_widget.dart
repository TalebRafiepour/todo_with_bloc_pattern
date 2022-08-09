import 'package:flutter/material.dart';

class NoTaskIndicatorWidget extends StatelessWidget {
  const NoTaskIndicatorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - kToolbarHeight * 2,
      child: const Center(
        child: Text('No Tasks Here!'),
      ),
    );
  }
}
