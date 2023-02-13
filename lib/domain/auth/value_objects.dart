import 'package:fpdart/fpdart.dart';
import 'package:notefire/domain/core/value_objects.dart';

import '../core/failures.dart';
import '../core/value_validators.dart';

class EmailAddress extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;
  factory EmailAddress(String input) {
    assert(input != '');
    return EmailAddress._(validateEmailAddress(input));
  }
  const EmailAddress._(
    this.value,
  );
}

class Password extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;
  factory Password(String input) {
    assert(input != '');
    return Password._(validatePassword(input));
  }
  const Password._(this.value);
}
