import 'dart:ui';

import 'package:fpdart/fpdart.dart';
import 'package:kt_dart/kt.dart';
import 'package:notefire/domain/core/value_transformers.dart';
import 'package:notefire/domain/core/value_validators.dart';

import '../core/failures.dart';
import '../core/value_objects.dart';

class NoteBody extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  static const maxLength = 1000;
  factory NoteBody(String input) {
    return NoteBody._(
      validateMaxStringLength(input, maxLength).flatMap(validatStringNotEmpty),
    );
  }
  const NoteBody._(this.value);
}

class TodoName extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  static const maxLength = 30;
  factory TodoName(String input) {
    return TodoName._(
      validateMaxStringLength(input, maxLength)
          .flatMap(validatStringNotEmpty)
          .flatMap(validateSingleLine),
    );
  }
  const TodoName._(this.value);
}

class NoteColor extends ValueObject<Color> {
  static const preDefinedColors = [
    Color(0xfffafafa),
    Color(0xfffa8072),
    Color(0xfffedc56),
    Color(0xffd0f0c0),
    Color(0xfffca3b7),
    Color(0xff997950),
    Color(0xfffffdd0),
  ];
  @override
  final Either<ValueFailure<Color>, Color> value;

  static const maxLength = 30;
  factory NoteColor(Color input) {
    return NoteColor._(
      right(makeColorOpaque(input)),
    );
  }
  const NoteColor._(this.value);
}

class List3<T> extends ValueObject<KtList<T>> {
  @override
  final Either<ValueFailure<KtList<T>>, KtList<T>> value;

  static const maxLength = 30;
  factory List3(KtList<T> input) {
    return List3._(validateMaxListlength(input, maxLength));
  }
  const List3._(this.value);
  int get length {
    return value.getOrElse((l) => emptyList()).size;
  }

  bool get isFull {
    return length == maxLength;
  }
}
