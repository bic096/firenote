import 'dart:convert';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/collection.dart';
import 'package:notefire/domain/auth/value_objects.dart';
import 'package:notefire/domain/notes/todo_item.dart';
import 'package:notefire/domain/notes/value_objects.dart';

import '../../domain/notes/note.dart';

part 'note_dtos.freezed.dart';
part 'note_dtos.g.dart';

@freezed
class NoteDto with _$NoteDto {
  const NoteDto._();
  const factory NoteDto(
          {@JsonKey(includeFromJson: false, includeToJson: false) String? id,
          required String body,
          required int color,
          required List<TodoItemDto> todos,
          @ServerTimestampConverter() required FieldValue serverTimestamp}) =
      _NoteDto;

  factory NoteDto.fromDomain(Note note) {
    return NoteDto(
        id: note.id.getOrCrash(),
        body: note.body.getOrCrash(),
        color: note.color.getOrCrash().value,
        todos: note.todos
            .getOrCrash()
            .asList()
            .map((e) => TodoItemDto.fromDomain(e))
            .toList(),
        serverTimestamp: FieldValue.serverTimestamp());
  }
  Note toDomain() => Note(
        id: UniqueId.formUniqueString(uniqueId: id!),
        body: NoteBody(body),
        color: NoteColor(Color(color)),
        todos: List3(KtList<TodoItem>.from(todos.map((e) => e.toDomain()))),
      );

  factory NoteDto.fromJson(Map<String, dynamic> json) =>
      _$NoteDtoFromJson(json);

  factory NoteDto.fromFireStore(DocumentSnapshot snapshot) => NoteDto.fromJson(
        jsonDecode(
          jsonEncode(snapshot.data()),
        ),
      ).copyWith(id: snapshot.id);
}

class ServerTimestampConverter implements JsonConverter<FieldValue, Object> {
  const ServerTimestampConverter();
  @override
  Object toJson(FieldValue fieldValue) {
    return fieldValue;
  }

  @override
  FieldValue fromJson(Object json) {
    return FieldValue.serverTimestamp();
  }
}

@freezed
class TodoItemDto with _$TodoItemDto {
  const TodoItemDto._();
  const factory TodoItemDto({
    required String id,
    required String name,
    required bool done,
  }) = _TodoItemDto;

  factory TodoItemDto.fromDomain(TodoItem todoItem) {
    return TodoItemDto(
        id: todoItem.id.getOrCrash(),
        name: todoItem.name.getOrCrash(),
        done: todoItem.done);
  }

  TodoItem toDomain() {
    return TodoItem(
      id: UniqueId.formUniqueString(uniqueId: id),
      name: TodoName(name),
      done: done,
    );
  }

  factory TodoItemDto.fromJson(Map<String, dynamic> json) =>
      _$TodoItemDtoFromJson(json);
}
