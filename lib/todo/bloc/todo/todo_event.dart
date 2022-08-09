part of 'todo_bloc.dart';

@immutable
abstract class TodoEvent {}

class AddTodoItemEvent extends TodoEvent {
  final ToDoTask task;

  AddTodoItemEvent({required this.task});
}
