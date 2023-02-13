import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

///the failure superclass for all value objects failures
@freezed
abstract class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.invalidEmail(String val) = InvalidEmail<T>;
  const factory ValueFailure.invalidPassword(String val) = InvalidPassword<T>;
}
