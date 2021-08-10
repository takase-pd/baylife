import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class BayLifeFirebaseUser {
  BayLifeFirebaseUser(this.user);
  final User user;
  bool get loggedIn => user != null;
}

BayLifeFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<BayLifeFirebaseUser> bayLifeFirebaseUserStream() => FirebaseAuth.instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<BayLifeFirebaseUser>(
        (user) => currentUser = BayLifeFirebaseUser(user));
