part of 'tasklist_bloc.dart';

abstract class TasklistState extends Equatable {
  const TasklistState();

  @override
  List<Object> get props => [];
}

class TasklistInitial extends TasklistState {}

class TaskListLoading extends TasklistState {}

class TaskListSuccess extends TasklistState {
  final List<Task> items;

  const TaskListSuccess(this.items);

  @override
  List<Object> get props => [items];
}

class TaskListError extends TasklistState {
  final String errorMessage;

  const TaskListError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
