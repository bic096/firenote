import 'package:fpdart/fpdart.dart';
import 'package:kt_dart/collection.dart';
import 'package:notefire/domain/core/note_failure.dart';
import 'package:notefire/domain/notes/note.dart';
import 'package:notefire/domain/notes/value_objects.dart';

abstract class INoteRepository {
  //watch all notes
  //watch only uncompleted notes
  //C_WD oprations

  Stream<Either<NoteFailure, KtList<Note>>> watchAll();
  Stream<Either<NoteFailure, KtList<Note>>> watchUncompleted();
  Future<Either<NoteFailure, Unit>> create(Note note);
  Future<Either<NoteFailure, Unit>> update(Note note);
  Future<Either<NoteFailure, Unit>> delete(Note note);
}
