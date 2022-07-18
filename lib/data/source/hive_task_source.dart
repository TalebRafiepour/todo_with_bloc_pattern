import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_with_bloc_pattern/data/data.dart';
import 'package:todo_with_bloc_pattern/data/source/source.dart';

class HiveTaskDataSource extends DataSource<Task> {
  final Box<Task> box;

  HiveTaskDataSource(this.box);

  @override
  Future<Task> createOrUpdate(Task data) async {
    if (data.isInBox) {
      data.save();
    } else {
      data.id = await box.add(data);
    }
    return data;
  }

  @override
  Future<void> delete(Task data) {
    return data.delete();
  }

  @override
  Future<void> deleteById(id) {
    return box.delete(id);
  }

  @override
  Future<Task> findById(id) async {
    return box.values.firstWhere((element) => element.id == id);
  }

  @override
  Future<List<Task>> getAll({String searchKeyword = ''}) async {
    return box.values
        .where((element) => element.name.contains(searchKeyword))
        .toList();
  }
}
