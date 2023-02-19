import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/collection.dart';
import 'package:notefire/domain/auth/value_objects.dart';
import 'package:notefire/domain/core/failures.dart';
import 'package:notefire/domain/notes/todo_item.dart';
import 'package:notefire/domain/notes/value_objects.dart';

part 'note.freezed.dart';

@freezed
class Note with _$Note {
  const Note._();
  const factory Note(
      {required UniqueId id,
      required NoteBody body,
      required NoteColor color,
      required List3<TodoItem> todos}) = _Note;

  factory Note.empty() => Note(
      id: UniqueId(),
      body: NoteBody(''),
      color: NoteColor(NoteColor.preDefinedColors[0]),
      todos: List3<TodoItem>(emptyList()));

  Option<ValueFailure<dynamic>> get failureOption {
    return body.failureOrUnit
        .andThen(() => todos.failureOrUnit)
        .andThen(() => todos
            .getOrCrash()
            .map((todoItem) => todoItem.failureOption)
            .filter((option) => option.isSome())
            .getOrElse(0, (_) => none())
            .fold(() => right(unit), (f) => left(f)))
        .fold(
          (f) => some(f),
          (_) => none(),
        );
  }
}
