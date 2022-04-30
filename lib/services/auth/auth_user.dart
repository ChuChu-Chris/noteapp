// the below import is used to show only the User class in the imported  package
import 'package:firebase_auth/firebase_auth.dart' show User;
import 'package:flutter/foundation.dart';
// import 'package:flutter/cupertino.dart';

@immutable
class AuthUser {
  final bool isEmailVerified;

  const AuthUser(this.isEmailVerified);
  factory AuthUser.fromFirebase(User user) => AuthUser(user.emailVerified);
}
