import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_with_bloc_pattern/todo/data/model/filter_options.dart';

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

  TodoBloc()
      : super(TodoState(
            tasks: [],
            filteredTasks: null,
            options: FilterOptions(isDone: false, tag: null))) {
    on<AddTodoItemEvent>(
      (event, emit) {
        List<ToDoTask> _tasks = state.tasks;
        _tasks.add(event.task);
        emit(state.copyWith(tasks: _tasks));
      },
    );

    on<RemoveAllTasksEvent>(
      (event, emit) {
        emit(state.copyWithThatMakesFilteredResultsNull(tasks: []));
      },
    );

    on<EditTaskEvent>(
      (event, emit) {
        if (event.newTask != event.oldTask) {
          List<ToDoTask> _tasks = state.tasks;
          int _itemIndex = _tasks.indexOf(event.oldTask);
          _tasks[_itemIndex] = event.newTask;
          emit(state.copyWith(tasks: _tasks));

          // * To be able to change state of stuff that are inside filtered list!
          if (state.filteredTasks != null) {
            List<ToDoTask> _filteredTasks = state.filteredTasks!;
            if (_filteredTasks.contains(event.oldTask)) {
              int _itemIndex = _filteredTasks.indexOf(event.oldTask);
              _filteredTasks[_itemIndex] = event.newTask;
            }
          }
        }
      },
    );

    on<RemoveTaskEvent>(
      (event, emit) {
        List<ToDoTask> _tasks = state.tasks;
        _tasks.remove(event.task);
        emit(state.copyWith(tasks: _tasks));

        // * To be able to change state of stuff that are inside filtered list!
        if (state.filteredTasks != null) {
          List<ToDoTask> _filteredTasks = state.filteredTasks!;
          if (_filteredTasks.contains(event.task)) {
            _filteredTasks.remove(event.task);
          }
        }
      },
    );

    on<MarkTaskEvent>(
      (event, emit) {
        List<ToDoTask> _tasks = state.tasks;
        int _itemIndex = _tasks.indexOf(event.task);
        _tasks[_itemIndex] =
            _tasks[_itemIndex].copyWith(isDone: !_tasks[_itemIndex].isDone);
        emit(state.copyWith(tasks: _tasks));

        // * To be able to change state of stuff that are inside filtered list!
        if (state.filteredTasks != null) {
          List<ToDoTask> _filteredTasks = state.filteredTasks!;
          if (_filteredTasks.contains(event.task)) {
            int _itemIndex = _filteredTasks.indexOf(event.task);
            _filteredTasks[_itemIndex] = _filteredTasks[_itemIndex]
                .copyWith(isDone: !_filteredTasks[_itemIndex].isDone);
          }
        }
      },
    );

    on<FilterTasksEvent>(((event, emit) {
      // log(state.options.toString());
      emit(state.copyWith(options: event.options));

      List<ToDoTask> _tasks = state.tasks;
      List<ToDoTask> _filteredTasks = _tasks;

      // * Handling isDone
      if (event.options.isDone == true) {
        _filteredTasks =
            _tasks.where((element) => (element.isDone == true)).toList();
      } else {
        _filteredTasks = _tasks;
      }
      // * Handling Tags
      if (event.options.tag != null) {
        _filteredTasks = _filteredTasks
            .where((element) => (element.tag == event.options.tag))
            .toList();
      }

      emit(state.copyWith(filteredTasks: _filteredTasks));
    }));

    on<RemoveFiltersEvent>(
      (event, emit) {
        emit(state.copyWithThatMakesFilteredResultsNull(
            options: FilterOptions(tag: null, isDone: false)));
      },
    );
  }
}
