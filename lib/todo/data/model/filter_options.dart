// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'enums/task_tag.dart';

class FilterOptions {
  final bool? isDone;
  final TaskTag? tag;

  FilterOptions({
    this.isDone,
    this.tag,
  });

  FilterOptions copyWith({
    bool? isDone,
    TaskTag? tag,
  }) {
    return FilterOptions(
      isDone: isDone ?? this.isDone,
      tag: tag ?? this.tag,
    );
  }

  @override
  String toString() => 'FilterOptions(isDone: $isDone, tag: $tag)';
}
