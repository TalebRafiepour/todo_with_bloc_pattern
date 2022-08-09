import 'package:flutter/material.dart';
import 'package:todo_with_bloc_pattern/todo/view/todo_home_screen.dart';

import 'constants/routes.dart';

class ToDoRouter {
  static Map<String, WidgetBuilder> routes = {
    ToDoRoutes.todoHomeScreen: (contex) => const ToDoHomeScreen(),
  };
}
