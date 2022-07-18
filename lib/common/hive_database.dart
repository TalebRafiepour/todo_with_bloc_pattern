import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_with_bloc_pattern/data/data.dart';

const boxName = 'tasks';
final box = Hive.box<Task>(boxName);

initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  Hive.registerAdapter(PriorityAdapter());
  await Hive.openBox<Task>(boxName);
}