import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_with_bloc_pattern/foundation/constants/routes.dart';
import 'package:todo_with_bloc_pattern/foundation/router.dart';

import 'foundation/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final hydratedStorage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  HydratedBlocOverrides.runZoned(
    () {
      runApp(const MyApp());
    },
    storage: hydratedStorage,
    blocObserver: ToDoBlocObserver(),
  );
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
