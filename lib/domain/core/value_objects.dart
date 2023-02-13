import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';

import 'failures.dart';

@immutable
abstract class ValueObject<T> {
  Either<ValueFailure<T>, T> get value;
  const ValueObject();
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
