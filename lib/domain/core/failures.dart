import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

///the failure superclass for all value objects failures

// @freezed
// abstract class ValueFailure<T> with _$ValueFailure<T> {
//   const factory ValueFailure.({required ValueFailure<T> f}) = _;
//   const factory ValueFailure.notes({required NotesValueFailure<T> f}) = _Notes;

// }

@freezed
abstract class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.invalidEmail(T val) = InvalidEmail<T>;
  const factory ValueFailure.invalidPassword(T val) = InvalidPassword<T>;
  const factory ValueFailure.exceedingLength(
      {required T failedValue, required int max}) = ExceedingLength<T>;
  const factory ValueFailure.empty({required T failedValue}) = Empty<T>;
  const factory ValueFailure.multiLines({required T failedValue}) =
      MultiLines<T>;
  const factory ValueFailure.listTooLonge(
      {required T failedValue, required int max}) = ListTooLonge<T>;
}

// @freezed
// class NotesValueFailure<T> with _$NotesValueFailure<T> {
//   const factory NotesValueFailure.exceedingLength(
//       {required T failedValue, required int max}) = ExceedingLength<T>;
//   const factory NotesValueFailure.empty({required T failedValue}) = Empty<T>;
//   const factory NotesValueFailure.multiLines({required T failedValue}) =
//       MultiLines<T>;
//   const factory NotesValueFailure.listTooLonge(
//       {required T failedValue, required int max}) = ListTooLonge<T>;
// }
