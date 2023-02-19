import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notefire/domain/auth/value_objects.dart';
import 'package:notefire/domain/core/failures.dart';
import 'package:notefire/domain/notes/value_objects.dart';

part 'todo_item.freezed.dart';

@freezed
class TodoItem with _$TodoItem {
  const TodoItem._();
  const factory TodoItem(
      {required UniqueId id,
      required TodoName name,
      required bool done}) = _TodoItem;

  factory TodoItem.empty() => TodoItem(
        id: UniqueId(),
        name: TodoName(''),
        done: false,
      );
  Option<ValueFailure<dynamic>> get failureOption {
    return name.value.fold((f) => some(f), (r) => none());
  }
}
