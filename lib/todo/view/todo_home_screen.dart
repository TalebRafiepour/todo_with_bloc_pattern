import 'package:flutter/material.dart';

class ToDoHomeScreen extends StatefulWidget {
  const ToDoHomeScreen({Key? key}) : super(key: key);

  @override
  State<ToDoHomeScreen> createState() => _ToDoHomeScreenState();
}

class _ToDoHomeScreenState extends State<ToDoHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDo App'),
      ),
      body: const Center(
        child: Text('Empty page'),
      ),
    );
  }
}