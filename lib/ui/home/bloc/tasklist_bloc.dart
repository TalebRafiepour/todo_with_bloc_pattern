import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_with_bloc_pattern/data/data.dart';
import 'package:todo_with_bloc_pattern/data/repo/repository.dart';

part 'tasklist_event.dart';
part 'tasklist_state.dart';

class TasklistBloc extends Bloc<TasklistEvent, TasklistState> {
  final Repository<Task> repository;

  TasklistBloc(this.repository) : super(TasklistInitial()) {
    on<TasklistEvent>((event, emit) async {
      if (event is TaskListStarted || event is TaskListSearch) {
        final String searchTerm;

        emit(TaskListLoading());
        // await Future.delayed(const Duration(seconds: 1));
        if (event is TaskListSearch) {
          searchTerm = event.searchTerm;
        } else {
          searchTerm = '';
        }

        final items = await repository.getAll(searchKeyword: searchTerm);
        try {
          emit(TaskListSuccess(items));
        } catch (e) {
          emit(const TaskListError('unknown error'));
        }
      }
    });
  }
}
