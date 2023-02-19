import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:notefire/domain/core/errors.dart';

import 'failures.dart';

@immutable
abstract class ValueObject<T> {
  Either<ValueFailure<T>, T> get value;
  const ValueObject();

  /// Without using `identity`, you must write a function to return
  /// the input parameter `(l) => l`.
  T getOrCrash() {
    return value.fold((f) => throw UnexpectedValueError(f), id);
  }

  Either<ValueFailure<dynamic>, Unit> get failureOrUnit {
    return value.fold(
      (f) => left(f),
      (r) => right(unit),
    );
  }

  bool isValid() => value.isRight();
  @override
  String toString() => 'ValueObject: $value';

  @override
  bool operator ==(covariant ValueObject<T> other) {
    if (identical(this, other)) return true;

    return other.value == value;
  }

  @override
  int get hashCode => value.hashCode;
}
