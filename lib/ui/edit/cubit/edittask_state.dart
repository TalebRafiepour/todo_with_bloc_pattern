part of 'edittask_cubit.dart';

@immutable
abstract class EdittaskState {
  final Task task;
  const EdittaskState(this.task);
}

class EdittaskInitial extends EdittaskState {
  const EdittaskInitial(task) : super(task);
}

class EditTaskPriorityChange extends EdittaskState {
  const EditTaskPriorityChange(task) : super(task);
}
