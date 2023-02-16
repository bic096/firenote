import 'package:fpdart/fpdart.dart';
import 'package:notefire/domain/auth/auth_failure.dart';
import 'package:notefire/domain/auth/value_objects.dart';

import './user.dart';

///Facade design pattern used for joining classes with different interfaces to
///unifide interface

abstract class IAuthFacade {
  Option<User> getSignInUser();
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword(
      {required EmailAddress emailAddress, required Password password});
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword(
      {required EmailAddress emailAddress, required Password password});
  Future<Either<AuthFailure, Unit>> signInWithGoogle();
  Future<void> signOut();
}
