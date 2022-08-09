import 'package:flutter/material.dart';
import 'package:todo_with_bloc_pattern/foundation/constants/routes.dart';
import 'package:todo_with_bloc_pattern/foundation/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo App',
      routes: ToDoRouter.routes,
      initialRoute: ToDoRoutes.todoHomeScreen,
    );
  }
}
