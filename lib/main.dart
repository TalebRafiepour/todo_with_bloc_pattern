import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_with_bloc_pattern/common/hive_database.dart';
import 'package:todo_with_bloc_pattern/data/repo/repository.dart';
import 'package:todo_with_bloc_pattern/data/source/hive_task_source.dart';
import 'package:todo_with_bloc_pattern/ui/home/home.dart';

void main() async {
  await initHive();
  runApp(ChangeNotifierProvider(
      create: (context) => Repository(HiveTaskDataSource(box)),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        inputDecorationTheme: const InputDecorationTheme(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          border: InputBorder.none,
        ),
      ),
      home: HomeScreen(),
    );
  }
}
