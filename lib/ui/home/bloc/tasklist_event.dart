part of 'tasklist_bloc.dart';

abstract class TasklistEvent extends Equatable {
  const TasklistEvent();

  @override
  List<Object> get props => [];
}

class TaskListStarted extends TasklistEvent {}

class TaskListSearch extends TasklistEvent {
  final String searchTerm;

  const TaskListSearch(this.searchTerm);

  @override
  List<Object> get props => [searchTerm];
}
