import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:todo_with_bloc_pattern/data/data.dart';
import 'package:todo_with_bloc_pattern/data/repo/repository.dart';

part 'edittask_state.dart';

class EdittaskCubit extends Cubit<EdittaskState> {
   final Task _task;
  final Repository repository;

  EdittaskCubit(this._task, this.repository) : super(EdittaskInitial(_task));

  void onSaveChangeClick() {
    repository.createOrUpdate(_task);
  }

  void onTextChanged(String text) {
    _task.name = text;
  }

  void onPriorityChanged(Priority priority) {
    _task.priority = priority;
    emit(EditTaskPriorityChange(_task));
  }
}
