import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

import '../../data/model/todo_task.dart';
import 'todo_state.dart';

part 'todo_event.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> with HydratedMixin {
  @override
  TodoState? fromJson(Map<String, dynamic> json) {
    return TodoState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TodoState state) {
    return state.toMap();
  }

  TodoBloc() : super(TodoState(tasks: [])) {
    on<AddTodoItemEvent>(
      (event, emit) {
        List<ToDoTask> _tasks = state.tasks;
        _tasks.add(event.task);
        emit(state.copyWith(tasks: _tasks));
      },
    );
  }
}
