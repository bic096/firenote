import 'package:notefire/domain/core/failures.dart';

class UnexpectedValueError implements Error {
  final ValueFailure valueFailure;

  UnexpectedValueError(this.valueFailure);
  @override
  String toString() {
    const explanation =
        'encountered a valueFailure at an unrecorvable point. terminating';
    return Error.safeToString('$explanation. failure was :$valueFailure');
  }

  @override
  StackTrace? get stackTrace => StackTrace.current;
}
