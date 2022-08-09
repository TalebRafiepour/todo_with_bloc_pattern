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

    on<RemoveAllTasksEvent>(
      (event, emit) {
        emit(state.copyWith(tasks: []));
      },
    );

    on<EditTaskEvent>(
      (event, emit) {
        if (event.newTask != event.oldTask) {
          List<ToDoTask> _tasks = state.tasks;
          int _itemIndex = _tasks.indexOf(event.oldTask);
          _tasks[_itemIndex] = event.newTask;
          emit(state.copyWith(tasks: _tasks));
        }
      },
    );

    on<RemoveTaskEvent>(
      (event, emit) {
        List<ToDoTask> _tasks = state.tasks;
        _tasks.remove(event.task);
        emit(state.copyWith(tasks: _tasks));
      },
    );

    on<MarkTaskEvent>(
      (event, emit) {
        List<ToDoTask> _tasks = state.tasks;
        // int _itemIndex = _tasks.indexOf(event.task);
        int _itemIndex = _tasks
            .indexOf(_tasks.where((element) => (element == event.task)).first);
        _tasks[_itemIndex] =
            _tasks[_itemIndex].copyWith(isDone: !_tasks[_itemIndex].isDone);
        emit(state.copyWith(tasks: _tasks));
      },
    );
  }
}
