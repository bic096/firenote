import 'package:fpdart/fpdart.dart';

import './failures.dart';

/// the file where all value validators live
Either<ValueFailure<String>, String> validateEmailAddress(String val) {
  const emailRegex =
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";

  if (RegExp(emailRegex).hasMatch(val)) {
    return right(val);
  } else {
    return left(ValueFailure.invalidEmail(val));
  }
}

Either<ValueFailure<String>, String> validatePassword(String val) {
  if (val.length >= 6) {
    return right(val);
  } else {
    return left(ValueFailure.invalidPassword(val));
  }
}
