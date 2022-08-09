part of 'todo_bloc.dart';

@immutable
abstract class TodoEvent {}

class AddTodoItemEvent extends TodoEvent {
  final ToDoTask task;

  AddTodoItemEvent({required this.task});
}

class RemoveAllTasksEvent extends TodoEvent {}

class EditTaskEvent extends TodoEvent {
  final ToDoTask oldTask;
  final ToDoTask newTask;

  EditTaskEvent({
    required this.oldTask,
    required this.newTask,
  });
}

class RemoveTaskEvent extends TodoEvent {
  final ToDoTask task;

  RemoveTaskEvent({required this.task});
}

class MarkTaskEvent extends TodoEvent {
  final ToDoTask task;

  MarkTaskEvent({required this.task});
}