enum TaskTag { mundane, work, study }

extension ExtOnTaskTag on TaskTag {
  String toMap() {
    return name;
  }
}

TaskTag enumFromMap(String tag) {
  return TaskTag.values.where((element) => element.name == tag).first;
}