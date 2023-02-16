import 'package:notefire/domain/auth/value_objects.dart';

import '../../domain/auth/user.dart' as domain;

import 'package:firebase_auth/firebase_auth.dart';

extension FirebaseUserDomainX on User {
  domain.User toDomain() {
    return domain.User(
      id: UniqueId.formUniqueString(
        uniqueId: uid,
      ),
    );
  }
}
